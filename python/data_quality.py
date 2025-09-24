import polars as pl
import duckdb


def read_pl(conn: duckdb.DuckDBPyConnection, sql: str) -> pl.DataFrame:
    return conn.execute(sql).pl()


def write_pl(conn: duckdb.DuckDBPyConnection, df: pl.DataFrame, full_name: str, overwrite: bool = True):
    schema, table = full_name.split(".", 1)
    conn.execute(f"CREATE SCHEMA IF NOT EXISTS {schema};")
    conn.register("_tmp_df", df.to_pandas())
    try:
        if overwrite:
            conn.execute(f"DROP TABLE IF EXISTS {full_name};")
        conn.execute(f"CREATE TABLE {full_name} AS SELECT * FROM _tmp_df;")
        print(f"wrote df to: {full_name}")
    finally:
        conn.unregister("_tmp_df")


def validate_logic(conn, policies_table: str, claims_table: str, src_schema: str, dq_schema: str) -> None:
    policies = read_pl(conn,
                       f"SELECT id_fact_policies FROM {src_schema}.{policies_table}")

    claims = read_pl(conn,
                     f"SELECT id_fact_claims, id_fact_policies, d_claim, d_end FROM {src_schema}.{claims_table}")

    duplicate_policies = (
        policies
        .with_columns(is_duplicate=pl.col("id_fact_policies").is_duplicated())
        .filter(pl.col("is_duplicate"))
        .drop("is_duplicate")
    )

    invalid_claims = (
        claims.filter(
            (pl.col("d_claim") > pl.col("d_end"))
        )
    )

    write_pl(conn, duplicate_policies, f"{dq_schema}.{policies_table}")
    write_pl(conn, invalid_claims, f"{dq_schema}.{claims_table}")


def offers_uniqueness(conn, offers_table: str, src_schema: str, out_schema: str, out_table: str) -> None:
    offers = read_pl(conn, f"""
        SELECT
            id_fact_offers,
            id_dim_customers,
            id_dim_products,
            dt_offer
        FROM {src_schema}.{offers_table}
    """)

    offers = offers.sort(["id_dim_customers", "id_dim_products", "dt_offer"], descending=[False, False, True])

    offers = offers.with_columns([
        pl.col("dt_offer").dt.truncate("1d").alias("start_of_the_day"),
        pl.col("dt_offer").dt.truncate("1w").alias("start_of_the_week"),
        pl.col("dt_offer").dt.truncate("1mo").alias("start_of_the_month"),
    ])

    offers = offers.with_columns([
        pl.col("dt_offer").rank(method="dense", descending=True)
        .over(["id_dim_customers", "id_dim_products", "start_of_the_day"]).alias("rn_day"),
        pl.col("dt_offer").rank(method="dense", descending=True)
        .over(["id_dim_customers", "id_dim_products", "start_of_the_week"]).alias("rn_week"),
        pl.col("dt_offer").rank(method="dense", descending=True)
        .over(["id_dim_customers", "id_dim_products", "start_of_the_month"]).alias("rn_month"),
    ])

    offers = offers.with_columns([
        (pl.col("rn_day") == 1).alias("UniqueDay"),
        (pl.col("rn_week") == 1).alias("UniqueWeek"),
        (pl.col("rn_month") == 1).alias("UniqueMonth"),
    ]).drop(["rn_day", "rn_week", "rn_month"])

    offers = (
        offers
        .select([
            "id_fact_offers", "id_dim_customers", "id_dim_products", "dt_offer",
            "UniqueDay", "UniqueWeek", "UniqueMonth"
        ])
        .unique(subset=["id_fact_offers"], keep="first")
    )

    write_pl(conn, offers, f"{out_schema}.{out_table}")

conn = duckdb.connect('../dbt/insurance_analytics/insurance_analytics.duckdb')
validate_logic(conn, 'fact_policies', 'fact_claims', 'dwh', 'dq')
offers_uniqueness(conn, 'fact_offers', 'dwh', 'dwh', 'dim_offers_unique')

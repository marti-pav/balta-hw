
  
  create view "insurance_analytics"."staging_csv"."stg_offers__dbt_tmp" as (
    WITH src AS (
    SELECT * FROM read_csv('../../data/raw/offers.csv')
)

, transformed AS (
    SELECT
        offer_id,
        customer_id,
        product_code,
        product_variant                    AS product_variant_name,
        CAST(offer_datetime  AS TIMESTAMP) AS dt_offer,
        CAST(premium_offered AS NUMERIC)   AS amt_premium_offered,
        sales_source                       AS sales_source_code,
        CAST(sum_insured     AS NUMERIC)   AS amt_sum_insured,
        coverage_hash
    FROM src
)

SELECT * FROM transformed
  );

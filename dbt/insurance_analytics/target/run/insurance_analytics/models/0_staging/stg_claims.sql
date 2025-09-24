
  
  create view "insurance_analytics"."staging_csv"."stg_claims__dbt_tmp" as (
    WITH src AS (
    SELECT * FROM read_csv_auto('../../data/raw/claims.csv')
)

, transformed AS (
    SELECT
        claim_id,
        policy_id,
        CAST(claim_date   AS DATE)    AS d_claim,
        CAST(claim_amount AS NUMERIC) AS amt_claim
    FROM src
)

select * from transformed
  );

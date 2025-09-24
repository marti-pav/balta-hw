
  
    
    

    create  table
      "insurance_analytics"."dwh"."kpis__dbt_tmp"
  
    as (
      WITH fact_claims AS (
    SELECT
        id_dim_products,
        id_dim_customers,
        amt_claim,
        amt_premium_written,
        d_start,
        d_end
    FROM "insurance_analytics"."dwh"."fact_claims"
),

, earned_premium AS (
    SELECT
        id_dim_products,
        (
          amt_premium_written * 1.0 * DATE_DIFF('day', d_start, LEAST(d_end, CURRENT_DATE))
          / NULLIF(DATE_DIFF('day', d_start, d_end), 0)
        ) AS earned_premium,
        amt_claim
    FROM fact
)
    );
  
  

  
    
    

    create  table
      "insurance_analytics"."dwh"."fact_offers__dbt_tmp"
  
    as (
      WITH offers AS (
    SELECT
        offer_id,
        customer_id,
        product_code,
        product_variant_name,
        dt_offer,
        amt_premium_offered,
        sales_source_code,
        amt_sum_insured,
        coverage_hash
    FROM "insurance_analytics"."staging_csv"."stg_offers"
)

, products AS (
    SELECT
        id_dim_products,
        product_code,
        product_variant_name
    FROM "insurance_analytics"."dwh"."dim_products"
)

SELECT
    o.offer_id AS id_fact_offers,
    customer_id AS id_dim_customers,
    pr.id_dim_products,
    dt_offer,
    amt_premium_offered,
    sales_source_code,
    amt_sum_insured,
    coverage_hash
FROM offers o
LEFT JOIN products pr
    ON o.product_code = pr.product_code
   AND o.product_variant_name = pr.product_variant_name
    );
  
  
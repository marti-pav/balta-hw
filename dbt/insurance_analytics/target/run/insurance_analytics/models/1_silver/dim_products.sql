
  
    
    

    create  table
      "insurance_analytics"."dwh"."dim_products__dbt_tmp"
  
    as (
      WITH products AS (
    SELECT DISTINCT
        product_code,
        product_variant_name
    FROM "insurance_analytics"."staging_csv"."stg_policies"

    UNION

    SELECT DISTINCT
        product_code,
        product_variant_name
    FROM "insurance_analytics"."staging_csv"."stg_offers"
)

SELECT
    ROW_NUMBER() OVER (ORDER BY product_code, product_variant_name) AS id_dim_products,
    product_code,
    product_variant_name
FROM products
    );
  
  
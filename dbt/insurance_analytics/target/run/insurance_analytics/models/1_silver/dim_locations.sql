
  
    
    

    create  table
      "insurance_analytics"."dwh"."dim_locations__dbt_tmp"
  
    as (
      WITH locations AS (
    SELECT DISTINCT
        city_name,
        country_code
    FROM "insurance_analytics"."staging_csv"."stg_customers"
)

SELECT
    ROW_NUMBER() OVER (ORDER BY country_code, city_name) AS id_dim_locations,
    city_name,
    country_code
FROM locations
    );
  
  
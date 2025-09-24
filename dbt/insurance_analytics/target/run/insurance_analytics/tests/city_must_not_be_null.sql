
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT
    id_dim_customers,
    city
FROM "insurance_analytics"."dwh"."dim_customers"
WHERE city IS NULL OR city = ''
  
  
      
    ) dbt_internal_test
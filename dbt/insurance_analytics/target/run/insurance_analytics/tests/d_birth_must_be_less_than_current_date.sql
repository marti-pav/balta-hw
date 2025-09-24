
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT
    customer_id,
    d_birth
FROM "insurance_analytics"."staging_csv"."stg_customers"
WHERE d_birth IS NULL
   OR d_birth > CURRENT_DATE
  
  
      
    ) dbt_internal_test
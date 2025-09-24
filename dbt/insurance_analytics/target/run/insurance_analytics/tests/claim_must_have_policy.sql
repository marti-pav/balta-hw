
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT
    id_fact_claims,
    id_fact_policies
FROM "insurance_analytics"."dwh"."fact_claims"
WHERE id_fact_policies IS NULL
  
  
      
    ) dbt_internal_test
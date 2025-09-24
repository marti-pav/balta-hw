
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT
    id_fact_claims,
    d_claim,
    d_start,
    d_end
FROM "insurance_analytics"."dwh"."fact_claims" c
WHERE d_claim NOT BETWEEN d_start AND d_end
  
  
      
    ) dbt_internal_test
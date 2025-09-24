
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT
    id_fact_claims,
    amt_claim,
    amt_sum_insured
FROM "insurance_analytics"."dwh"."fact_claims" c
WHERE amt_claim > amt_sum_insured
  
  
      
    ) dbt_internal_test

    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT
    cl.claim_id,
    cl.policy_id
FROM "insurance_analytics"."staging_csv"."stg_claims" cl
LEFT JOIN "insurance_analytics"."staging_csv"."stg_policies" p
       ON cl.policy_id = p.policy_id
WHERE p.policy_id IS NULL
  
  
      
    ) dbt_internal_test
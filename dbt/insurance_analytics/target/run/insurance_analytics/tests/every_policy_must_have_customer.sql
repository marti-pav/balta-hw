
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT p.policy_id, p.customer_id
FROM "insurance_analytics"."staging_csv"."stg_policies" p
LEFT JOIN "insurance_analytics"."staging_csv"."stg_customers" c
       ON p.customer_id = c.customer_id
WHERE c.customer_id IS NULL
  
  
      
    ) dbt_internal_test
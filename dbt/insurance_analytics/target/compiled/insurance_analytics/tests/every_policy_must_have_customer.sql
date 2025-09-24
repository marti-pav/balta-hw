SELECT p.policy_id, p.customer_id
FROM "insurance_analytics"."staging_csv"."stg_policies" p
LEFT JOIN "insurance_analytics"."staging_csv"."stg_customers" c
       ON p.customer_id = c.customer_id
WHERE c.customer_id IS NULL
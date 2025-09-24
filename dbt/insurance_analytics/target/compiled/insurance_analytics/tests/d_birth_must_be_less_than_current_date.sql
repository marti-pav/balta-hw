SELECT
    customer_id,
    d_birth
FROM "insurance_analytics"."staging_csv"."stg_customers"
WHERE d_birth IS NULL
   OR d_birth > CURRENT_DATE
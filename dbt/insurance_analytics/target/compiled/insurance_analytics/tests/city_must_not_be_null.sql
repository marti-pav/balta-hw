SELECT
    id_dim_customers,
    city
FROM "insurance_analytics"."dwh"."dim_customers"
WHERE city IS NULL OR city = ''
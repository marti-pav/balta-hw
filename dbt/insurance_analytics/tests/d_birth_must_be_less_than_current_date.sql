SELECT
    customer_id,
    d_birth
FROM {{ ref('stg_customers') }}
WHERE d_birth IS NULL
   OR d_birth > CURRENT_DATE
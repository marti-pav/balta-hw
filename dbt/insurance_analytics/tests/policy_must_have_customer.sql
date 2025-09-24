SELECT
    p.policy_id,
    p.customer_id
FROM {{ ref('stg_policies') }} p
LEFT JOIN {{ ref('stg_customers') }} c
       ON p.customer_id = c.customer_id
WHERE c.customer_id IS NULL
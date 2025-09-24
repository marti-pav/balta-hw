WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
)

SELECT
    customer_id AS id_pii_dim_customers,
    first_name,
    last_name,
    d_birth,
    DATE_DIFF('year', d_birth, CURRENT_DATE) AS age,
    gender_code,
    city_name,
    country_code
FROM customers

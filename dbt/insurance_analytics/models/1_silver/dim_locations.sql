WITH locations AS (
    SELECT DISTINCT
        city_name,
        country_code
    FROM {{ ref('stg_customers') }}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY country_code, city_name) AS id_dim_locations,
    city_name,
    country_code
FROM locations

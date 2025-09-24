WITH customers AS (
    SELECT * FROM "insurance_analytics"."staging_csv"."stg_customers"
)

, segments AS (
    SELECT
        id_dim_customer_segments,
        segment_code
    FROM "insurance_analytics"."dwh"."dim_customer_segments"
)

, locations AS (
    SELECT
        id_dim_locations,
        city_name,
        country_code
    FROM "insurance_analytics"."dwh"."dim_locations"
)

SELECT
    c.customer_id AS id_dim_customers,
    s.id_dim_customer_segments,
    l.id_dim_locations,
    c.d_created
FROM customers c
LEFT JOIN segments s
    ON c.segment_code = s.segment_code
LEFT JOIN locations l
    ON c.city_name = l.city_name
   AND c.country_code = l.country_code
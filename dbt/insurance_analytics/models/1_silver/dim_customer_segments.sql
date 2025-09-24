WITH segments AS (
    SELECT DISTINCT
        segment_code
    FROM {{ ref('stg_customers') }}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY segment_code) AS id_dim_customer_segments,
    segment_code
FROM segments
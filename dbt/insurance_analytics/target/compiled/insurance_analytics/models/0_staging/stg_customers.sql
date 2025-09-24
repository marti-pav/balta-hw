WITH src AS (
    SELECT * FROM read_csv_auto('../../data/raw/customers.csv')
)

, transformed as (
    SELECT
        customer_id,
        first_name,
        last_name,
        CAST(birth_date AS DATE) AS d_birth,
        gender                   AS gender_code,
        city                     AS city_name,
        segment                  AS segment_code,
        CAST(created_at AS DATE) AS d_created,
        country                  AS country_code
    FROM src
)

SELECT * FROM transformed
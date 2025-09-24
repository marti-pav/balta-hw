WITH src AS (
    SELECT * FROM {{ source('raw', 'policies') }}
)

, transformed AS (
    SELECT
        policy_id,
        customer_id,
        product_code,
        product_variant                  AS product_variant_name,
        CAST(start_date      AS DATE)    AS d_start,
        CAST(end_date        AS DATE)    AS d_end,
        policy_status                    AS policy_status_code,
        CAST(written_premium AS NUMERIC) AS amt_premium_written,
        CAST(sum_insured     AS NUMERIC) AS amt_sum_insured,
        currency                         AS currency_code,
        sales_channel                    AS sales_channel_code,
        policy_version
    FROM src

)

SELECT * FROM transformed

WITH policies AS (
    SELECT
        policy_id,
        customer_id,
        product_code,
        product_variant_name,
        d_start,
        d_end,
        amt_premium_written,
        amt_sum_insured,
        policy_status_code,
        currency_code,
        sales_channel_code,
        policy_version
    FROM {{ ref('stg_policies') }}
)

, products AS (
    SELECT
        id_dim_products,
        product_code,
        product_variant_name
    FROM {{ ref('dim_products') }}
)

, policy_statuses AS (
    SELECT
        id_dim_policy_statuses,
        policy_status_code
    FROM {{ ref('dim_policy_statuses') }}
)

, sales_channels AS (
    SELECT
        id_dim_sales_channels,
        sales_channel_code
    FROM {{ ref('dim_sales_channels') }}
)

SELECT
    p.policy_id             AS id_fact_policies,
    p.customer_id           AS id_dim_customers,
    pr.id_dim_products,
    s.id_dim_policy_statuses,
    sa.id_dim_sales_channels,
    p.d_start,
    p.d_end,
    p.amt_premium_written,
    p.amt_sum_insured,
    p.currency_code,
    p.policy_version
FROM policies p
LEFT JOIN products pr
    ON p.product_code = pr.product_code
   AND p.product_variant_name = pr.product_variant_name
LEFT JOIN policy_statuses s
    ON p.policy_status_code = s.policy_status_code
LEFT JOIN sales_channels sa
    ON p.sales_channel_code = sa.sales_channel_code
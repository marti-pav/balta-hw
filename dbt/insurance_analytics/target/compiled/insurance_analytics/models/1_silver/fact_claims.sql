WITH claims AS (
    SELECT
        claim_id,
        policy_id,
        d_claim,
        amt_claim
    FROM "insurance_analytics"."staging_csv"."stg_claims"
)

, policies AS (
    SELECT
        id_fact_policies,
        id_dim_customers,
        id_dim_products,
        id_dim_policy_statuses,
        id_dim_sales_channels,
        d_start,
        d_end,
        amt_premium_written,
        amt_sum_insured,
        currency_code,
        policy_version
    FROM "insurance_analytics"."dwh"."fact_policies"
)

SELECT
    c.claim_id              AS id_fact_claims,
    p.id_fact_policies,
    p.id_dim_customers,
    p.id_dim_products,
    p.id_dim_policy_statuses,
    p.id_dim_sales_channels,
    c.d_claim,
    p.d_start,
    p.d_end,
    c.amt_claim,
    p.amt_premium_written,
    p.amt_sum_insured,
    p.currency_code,
    p.policy_version
FROM claims c
LEFT JOIN policies p
    ON c.policy_id = p.id_fact_policies
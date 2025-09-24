WITH base AS (
    SELECT
        id_dim_customers,
        id_dim_products,
        amt_claim,
        amt_premium_written,
        d_start,
        d_end
    FROM "insurance_analytics"."dwh"."fact_claims"
)

, earned_premium_calc AS (
    SELECT
        *,
         (amt_premium_written *
         DATE_DIFF('day', d_start, LEAST(d_end, CURRENT_DATE))
         / DATE_DIFF('day', d_start, d_end)) AS earned_premium
    FROM base
)

, earned_premium_and_claim_ratio_by_product AS (
    SELECT
        id_dim_products,
        SUM(earned_premium) AS earned_premium,
        SUM(amt_claim) / SUM(earned_premium) AS claim_ratio
    FROM earned_premium_calc
    GROUP BY id_dim_products
)

, age_groups AS (
    SELECT
        id_pii_dim_customers,
        CASE
            WHEN age < 25 THEN '18-24'
            WHEN age < 35 THEN '25-34'
            WHEN age < 51 THEN '35-50'
            WHEN age < 64 THEN '51-63'
            ELSE '64+'
        END AS age_band
    FROM "insurance_analytics"."dwh"."pii_dim_customers"
)

, avg_premium_and_claim_by_age AS (
    SELECT
        ag.age_band,
        AVG(e.amt_premium_written) AS avg_premium,
        AVG(e.amt_claim) AS avg_claim
    FROM earned_premium_calc e
    JOIN age_groups ag
      ON e.id_dim_customers = ag.id_pii_dim_customers
    GROUP BY ag.age_band
)

SELECT
    'earned_premium_by_product' AS kpi_name,
    CAST(id_dim_products AS VARCHAR) AS dimension_value,
    earned_premium AS kpi_value
FROM earned_premium_and_claim_ratio_by_product

UNION ALL

SELECT
    'claim_ratio_by_product' AS kpi_name,
    CAST(id_dim_products AS VARCHAR) AS dimension_value,
    claim_ratio AS kpi_value
FROM earned_premium_and_claim_ratio_by_product

UNION ALL

SELECT
    'avg_premium_by_age' AS kpi_name,
    age_band AS dimension_value,
    avg_premium AS kpi_value
FROM avg_premium_and_claim_by_age

UNION ALL

SELECT
    'avg_claim_by_age' AS kpi_name,
    age_band AS dimension_value,
    avg_claim AS kpi_value
FROM avg_premium_and_claim_by_age
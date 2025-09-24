SELECT
    id_fact_claims,
    id_fact_policies
FROM {{ ref('fact_claims') }}
WHERE id_fact_policies IS NULL
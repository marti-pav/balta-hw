SELECT
    id_fact_claims,
    d_claim,
    d_start,
    d_end
FROM {{ ref('fact_claims') }} c
WHERE d_claim NOT BETWEEN d_start AND d_end
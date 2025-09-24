SELECT
    id_fact_claims,
    d_claim,
    d_start,
    d_end
FROM "insurance_analytics"."dwh"."fact_claims" c
WHERE d_claim NOT BETWEEN d_start AND d_end
SELECT
    id_fact_claims,
    id_fact_policies
FROM "insurance_analytics"."dwh"."fact_claims"
WHERE id_fact_policies IS NULL
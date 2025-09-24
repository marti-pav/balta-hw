SELECT
    id_fact_claims,
    amt_claim,
    amt_sum_insured
FROM "insurance_analytics"."dwh"."fact_claims" c
WHERE amt_claim > amt_sum_insured
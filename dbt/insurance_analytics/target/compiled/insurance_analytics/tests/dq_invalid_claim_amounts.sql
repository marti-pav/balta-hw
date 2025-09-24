SELECT
    c.id_fact_claims,
    c.amt_claim,
    p.amt_sum_insured
FROM "insurance_analytics"."dwh"."fact_claims" c
JOIN "insurance_analytics"."dwh"."fact_policies" p
  ON c.id_fact_policies = p.id_fact_policies
WHERE c.amt_claim > p.amt_sum_insured
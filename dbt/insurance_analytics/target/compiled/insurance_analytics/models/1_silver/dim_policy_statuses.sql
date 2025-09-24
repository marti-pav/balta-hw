WITH policy_statuses AS (
    SELECT DISTINCT policy_status_code FROM "insurance_analytics"."staging_csv"."stg_policies"
)

SELECT
  ROW_NUMBER() OVER (ORDER BY policy_status_code) AS id_dim_policy_statuses,
  policy_status_code
FROM policy_statuses
WITH src AS (
    SELECT * FROM {{ source('raw', 'claims') }}
)

, transformed AS (
    SELECT
        claim_id,
        policy_id,
        CAST(claim_date   AS DATE)    AS d_claim,
        CAST(claim_amount AS NUMERIC) AS amt_claim
    FROM src
)

select * from transformed
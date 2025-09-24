WITH sales_channels AS (
    SELECT DISTINCT sales_channel_code FROM "insurance_analytics"."staging_csv"."stg_policies"
)

SELECT
  ROW_NUMBER() OVER (ORDER BY sales_channel_code) AS id_dim_sales_channels,
  sales_channel_code
FROM sales_channels
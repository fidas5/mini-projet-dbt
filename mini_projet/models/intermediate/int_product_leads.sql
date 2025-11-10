WITH product_leads AS (                 -- Temporary table for product leads
    SELECT
        p.internal_id AS product_id,    -- Standardized product ID
        p.name AS product_name,         -- Product name
        COUNT(l.account_id) AS interested_customers  
        -- Count number of leads (customers) interested in this product
    FROM {{ ref('stg_products') }} p   -- Reference staging products
    LEFT JOIN {{ ref('stg_leads') }} l -- Join leads
      ON p.name = l.company            -- Match product name to company name (simplified for demo)
    GROUP BY p.internal_id, p.name      -- Group by product to count interested customers
)

SELECT *
FROM product_leads
{{ config(materialized='table', schema='intermediate') }}  
-- Persist as a table in intermediate schema

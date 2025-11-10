{{ config(materialized='table',schema = 'intermediate')}}

WITH customer_leads AS (             -- Create a temporary table (CTE) named customer_leads
    SELECT
        c.customer_id,               -- Take customer ID from staging customers
        c.first_name,                -- Take first name
        c.last_name,                 -- Take last name
        COUNT(l.account_id) AS total_leads  -- Count number of leads associated with this customer
    FROM {{ ref('stg_customers') }} c   -- Reference the staging customers model
    LEFT JOIN {{ ref('stg_leads') }} l  -- Join leads (if any) to customers
    ON c.customer_id = l.account_id      -- Join condition
    GROUP BY c.customer_id, c.first_name, c.last_name  
    -- Group by customer to aggregate the number of leads
)

SELECT *
FROM customer_leads                   -- Select all columns from CTE
{{ config(materialized='table') }}    -- Persist this result as a TABLE for intermediate/mart use

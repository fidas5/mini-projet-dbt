{{ config(materialized='view') }}  
-- Tells dbt to create a VIEW in the warehouse for this model
-- Views are virtual tables, no storage cost, always reflect the latest source data

select
    `Customer Id` as customer_id,  -- Rename raw column 'Customer Id' to 'customer_id' for standardization
    `First Name` as first_name,    -- Rename to 'first_name'
    `Last Name` as last_name,      -- Rename to 'last_name'
    company,                       -- Keep company column as-is
    city,                          -- Keep city column
    country,                       -- Keep country column
    `Phone 1` as phone_1,          -- Rename phone column
    `Phone 2` as phone_2,          -- Rename phone column
    email,                          -- Keep email column
    `Subscription Date` as subscription_date,  -- Rename subscription date
    website                          -- Keep website column
from {{ source('miniProjet', 'customers') }}  
-- Fetches data from the raw source table 'customers' in your 'miniProjet' source

{{ config(materialized='view') }}  
-- Create a view for leads

select
    `Account Id` as account_id,    -- Standardize column name
    `Lead Owner` as lead_owner,    -- Standardize column name
    `First Name` as first_name,    -- Rename first name
    `Last Name` as last_name,      -- Rename last name
    company,                       -- Keep company column
    `Phone 1` as phone_1,          -- Rename phone column
    `Phone 2` as phone_2,          -- Rename phone column
    `Email 1` as email_1,          -- Rename email column
    `Email 2` as email_2,          -- Rename email column
    website,                        -- Keep website
    source,                         -- Keep lead source
    `Deal Stage` as deal_stage,    -- Rename deal stage
    notes                           -- Keep notes column
from {{ source('miniProjet', 'leads') }}  
-- Fetch raw leads table from your source

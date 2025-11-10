{{ config(materialized='table', schema='intermediate') }}  
-- Create a TABLE (persisted in warehouse) in 'intermediate' schema
-- We use table here because products might be reused in multiple calculations

select
    `Internal ID` as internal_id,  -- Standardize internal product ID
    name,                           -- Keep product name
    description,                    -- Keep description
    brand,                          -- Keep brand
    category,                       -- Keep category
    price,                          -- Keep price
    currency,                       -- Keep currency
    stock,                          -- Keep stock quantity
    ean,                            -- Keep product barcode
    color,                          -- Keep color
    size,                           -- Keep size
    availability                     -- Keep availability
from {{ source('miniProjet', 'products') }}  
-- Fetch raw products table from source

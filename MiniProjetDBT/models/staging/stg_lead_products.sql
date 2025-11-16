{{ config(materialized='table') }}

with leads as (
    select account_id as lead_id  
    from {{ ref('stg_leads') }}
),
products as (
    select internal_id as product_id
    from {{ ref('stg_products') }}
),

-- Génération aléatoire de relations lead → product
lead_products as (
    select
        row_number() over() as lead_product_id,
        l.lead_id,
        p.product_id,
        current_date as assigned_date
    from leads l
    join products p
    on rand() < 0.2  -- environ 20% des combinaisons seront conservées
)

select *
from lead_products

{{ config(materialized='table') }}

select
    l.account_id as lead_id,
    l.first_name,
    l.last_name,
    lp.product_id,
    p.name as product_name,
    lp.assigned_date
from {{ ref('stg_lead_products') }} lp
join {{ ref('stg_leads') }} l on lp.lead_id = l.account_id
join {{ ref('stg_products') }} p on lp.product_id = p.internal_id

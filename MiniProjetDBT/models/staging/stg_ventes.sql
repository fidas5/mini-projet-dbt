
with customers as (
    select customer_id
    from {{ ref('stg_customers') }}
),
products as (
    select internal_id as product_id, price
    from {{ ref('stg_products') }}
),

-- Génération artificielle de ventes
sales as (
    select
        row_number() over() as sale_id,          -- identifiant unique pour chaque vente
        c.customer_id,
        p.product_id,
        current_date as sale_date,               -- date fictive de vente
        p.price as sale_amount
    from customers c
    join products p
    on rand() < 0.1                             -- probabilité artificielle d'achat
)

select *
from sales

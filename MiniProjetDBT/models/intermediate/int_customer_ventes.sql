select
    c.customer_id,
    c.first_name,
    c.last_name,
    s.sale_id,
    s.product_id,
    p.name as product_name,
    s.sale_amount,
    s.sale_date
from {{ ref('stg_ventes') }} s
join {{ ref('stg_customers') }} c on s.customer_id = c.customer_id
join {{ ref('stg_products') }} p on s.product_id = p.internal_id

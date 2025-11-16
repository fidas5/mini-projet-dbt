{{ config(materialized='table') }}

with sales as (
    select *
    from {{ ref('int_customer_ventes') }}
),

-- Total ventes per customer
client_sales as (
    select
        customer_id,
        first_name,
        last_name,
        count(sale_id) as total_orders,
        sum(sale_amount) as total_spent
    from sales
    group by customer_id, first_name, last_name
),

-- Total ventes per product
product_sales as (
    select
        product_id,
        product_name,
        count(sale_id) as total_orders,
        sum(sale_amount) as total_revenue
    from sales
    group by product_id, product_name
),

-- Total ventes per month
monthly_sales as (
    select
        date_trunc(sale_date, month) as sale_month,
        count(sale_id) as total_orders,
        sum(sale_amount) as total_revenue
    from sales
    group by sale_month
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.total_orders as customer_total_orders,
    c.total_spent as customer_total_spent,
    p.product_id,
    p.product_name,
    p.total_orders as product_total_orders,
    p.total_revenue as product_total_revenue,
    m.sale_month,
    m.total_orders as month_total_orders,
    m.total_revenue as month_total_revenue
from client_sales c
cross join product_sales p
cross join monthly_sales m

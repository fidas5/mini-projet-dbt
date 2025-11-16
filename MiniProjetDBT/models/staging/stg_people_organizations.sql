{{ config(materialized='table') }}

with people as (
    select user_id
    from {{ ref('stg_people') }}
),
organizations as (
    select organization_id
    from {{ ref('stg_organizations') }}
),

people_org as (
    select
        row_number() over() as index_id,
        p.user_id,
        o.organization_id,
        current_date as assigned_date
    from people p
    join organizations o
    on rand() < 0.3  -- each person has ~30% chance to belong to an org
)

select *
from people_org

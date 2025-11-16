with orgs as (
    select organization_id
    from {{ ref('stg_organizations') }}
),
people as (
    select user_id
    from {{ ref('stg_people') }}
),

-- assign randomly ~20% of people to orgs
org_people as (
    select
        row_number() over() as org_person_id,
        o.organization_id,
        p.user_id
    from orgs o
    cross join people p
    where rand() < 0.2
)

select *
from org_people

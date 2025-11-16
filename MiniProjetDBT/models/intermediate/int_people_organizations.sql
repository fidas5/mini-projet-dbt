select
    po.user_id,
    po.organization_id,
    o.name as organization_name,
    p.first_name,
    p.last_name,
    po.assigned_date
from {{ ref('stg_people_organizations') }} po
join {{ ref('stg_people') }} p on po.user_id = p.user_id
join {{ ref('stg_organizations') }} o on po.organization_id = o.organization_id

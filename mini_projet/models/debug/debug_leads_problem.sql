select *
from {{ ref('stg_leads') }}
where account_id is not null

select
  cast(Index as int64) as index_id,
  `Organization Id` as organization_id,
  Name as name,
  Website as website,
  Country as country,
  Description as description,
  cast(Founded as int64) as founded_year,
  Industry as industry,
  cast(`Number of employees` as int64) as number_of_employees
from {{ ref('organizations') }}

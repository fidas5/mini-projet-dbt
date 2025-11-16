select
  cast(Index as int64) as index_id,
  `User Id` as user_id,
  `First Name` as first_name,
  `Last Name` as last_name,
  Sex as sex,
  Email as email,
  Phone as phone,
  cast(`Date of birth` as date) as date_of_birth,
  `Job Title` as job_title
from {{ ref('people') }}

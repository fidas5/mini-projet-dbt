select
  cast(Index as int64) as index_id,
  `Account Id` as account_id,
  `Lead Owner` as lead_owner,
  `First Name` as first_name,
  `Last Name` as last_name,
  Company as company,
  `Phone 1` as phone_1,
  `Phone 2` as phone_2,
  `Email 1` as email_1,
  `Email 2` as email_2,
  Website as website,
  Source as source,
  `Deal Stage` as deal_stage,
  Notes as notes
from {{ ref('leads') }}

select
  cast(Index as int64) as index_id,
  `Customer Id` as customer_id,
  `First Name` as first_name,
  `Last Name` as last_name,
  Company as company,
  City as city,
  Country as country,
  `Phone 1` as phone_1,
  `Phone 2` as phone_2,
  Email as email,
  cast(`Subscription Date` as date) as subscription_date,
  Website as website
  from {{ ref('customers') }}
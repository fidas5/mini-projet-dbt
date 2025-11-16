select
  cast(Index as int64) as index_id,
  Name as name,
  Description as description,
  Brand as brand,
  Category as category,
  cast(Price as float64) as price,
  Currency as currency,
  cast(Stock as int64) as stock,
  EAN as ean,
  Color as color,
  Size as size,
  Availability as availability,
  cast(`Internal ID` as int64) as internal_id
from {{ ref('products') }}

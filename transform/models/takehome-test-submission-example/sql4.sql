
WITH ranked_vendors AS (
  SELECT
    ord.date_local,
    ord.country_name,
    vr.vendor_name,
    SUM(ord.gmv_local) AS total_gmv,
    ROW_NUMBER() OVER (PARTITION BY ord.date_local, ord.country_name ORDER BY SUM(ord.gmv_local) DESC) AS rank
  FROM
    `1.Orders` as ord
    LEFT JOIN `1.Vendors` as vr ON vr.id = ord.vendor_id
  GROUP BY
    ord.date_local,
    ord.country_name,
    vr.vendor_name
)
SELECT
  date_local,
  country_name,
  vendor_name,
  total_gmv
FROM
  ranked_vendors
WHERE
  rank <= 2;
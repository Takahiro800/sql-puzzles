SELECT
  customer_name,
  DATE_DIFF(max(sale_date), min(sale_date), DAY) / (count(*) -1) AS avg_gap
FROM
  dataset.Sales
GROUP BY
  customer_name
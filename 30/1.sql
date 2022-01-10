WITH LastSales AS (
  SELECT
    S1.customer_name AS customer_name,
    S1.sale_date AS this_sale_date,
    (
      SELECT
        max(S2.sale_date)
      FROM
        dataset.Sales AS S2
      WHERE
        S2.sale_date < S1.sale_date
        AND S1.customer_name = S2.customer_name
    ) AS last_sale_date
  FROM
    dataset.Sales AS S1
),
SalesGap AS (
  SELECT
    customer_name,
    DATE_DIFF(this_sale_date, last_sale_date, DAY) AS gap
  FROM
    LastSales
)
SELECT
  customer_name,
  avg(gap) AS avg_diff
FROM
  SalesGap
GROUP BY
  customer_name

/*
+---------------+----------+
| customer_name | avg_diff |
+---------------+----------+
| Fred          |      3.0 |
| Mary          |      7.0 |
| Bill          |      1.0 |
+---------------+----------+
Duration             User Email          Bytes Processed   Bytes Billed   Billing Tier   Labels
---------------- -------------------------- ----------------- -------------- -------------- --------
0:00:00.581000   hirotaka081630@gmail.com   168               10485760       1


*/
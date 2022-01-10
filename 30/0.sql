WITH diff AS(
  SELECT
    customer_name,
    --  前回の購入日からの差分を算出
    DATE_DIFF(
      sale_date,
      lag(sale_date) over (
        PARTITION by customer_name
        ORDER BY
          sale_date
      ),
      DAY
    ) AS date_diff
  FROM
    dataset.Sales
)
SELECT
  customer_name,
  avg(date_diff) AS avg_diff
FROM
  diff
GROUP BY
  customer_name
  /*
結果
| customer_name | avg_diff |
+---------------+-----+
| Mary          | 7.0 |
| Bill          | 1.0 |
| Fred          | 3.0 |
+---------------+-----+

Duration             User Email          Bytes Processed   Bytes Billed   Billing Tier   Labels
----------------- -------------------------- ----------------- -------------- -------------- --------
0:00:00.039000   hirotaka081630@gmail.com   0                 0

   */
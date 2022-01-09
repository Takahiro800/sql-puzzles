SELECT
  cust_id,
  '0-30 days =' AS age,
  sum(pizza_amt) AS sum_amt
FROM
  dataset.FriendsOfPepperoni
WHERE
  DATE_DIFF('2007-06-01', bill_date, DAY) <= 30
GROUP BY
  cust_id
UNION
ALL
SELECT
  cust_id,
  '31-60 days =' AS age,
  sum(pizza_amt) AS sum_amt
FROM
  dataset.FriendsOfPepperoni
WHERE
  DATE_DIFF('2007-06-01', bill_date, DAY) > 30
  AND DATE_DIFF('2007-06-01', bill_date, DAY) <= 60
GROUP BY
  cust_id
UNION
ALL
SELECT
  cust_id,
  '61-90 days =' AS age,
  sum(pizza_amt) AS sum_amt
FROM
  dataset.FriendsOfPepperoni
WHERE
  DATE_DIFF('2007-06-01', bill_date, DAY) BETWEEN 61
  AND 90
GROUP BY
  cust_id
UNION
ALL
SELECT
  cust_id,
  '90 days over =' AS age,
  sum(pizza_amt) AS sum_amt
FROM
  dataset.FriendsOfPepperoni
WHERE
  DATE_DIFF('2007-06-01', bill_date, DAY) > 90
GROUP BY
  cust_id
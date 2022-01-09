SELECT
  cust_id,
  sum(
    CASE
      WHEN DATE_DIFF('2007-06-01', bill_date, DAY) <= 30 THEN pizza_amt
      ELSE 0
    END
  ) AS age1,
  sum(
    CASE
      WHEN DATE_DIFF('2007-06-01', bill_date, DAY) BETWEEN 31
      AND 60 THEN pizza_amt
      ELSE 0
    END
  ) AS age2,
  sum(
    CASE
      WHEN DATE_DIFF('2007-06-01', bill_date, DAY) BETWEEN 61
      AND 90 THEN pizza_amt
      ELSE 0
    END
  ) AS age3,
  sum(
    CASE
      WHEN DATE_DIFF('2007-06-01', bill_date, DAY) > 90 THEN pizza_amt
      ELSE 0
    END
  ) AS age4
FROM
  dataset.FriendsOfPepperoni
GROUP BY
  cust_id
ORDER BY
  cust_id
WITH X AS (
  SELECT
    student_name,
    credit_cat,
    sum(credits) AS sum_credits
  FROM
    dataset.CreditsEarned
  GROUP BY
    student_name,
    credit_cat
)
SELECT
  X.student_name,
  CASE
    WHEN count(C1.credit_cat) >= (
      SELECT
        count(*) AS req_count
      FROM
        dataset.Categories
    ) THEN 'X'
    ELSE ''
  END AS grad,
  CASE
    WHEN count(C1.credit_cat) < (
      SELECT
        count(*) AS req_count
      FROM
        dataset.Categories
    ) THEN 'X'
    ELSE ''
  END AS nograd
FROM
  X
  LEFT OUTER JOIN dataset.Categories AS C1 ON X.credit_cat = C1.credit_cat
  AND X.sum_credits >= C1.rqd_credits
GROUP BY
  student_name
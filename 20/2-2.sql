SELECT
  test_name,
  count(*) AS needed_steps,
  count(*) - count(comp_date) AS missing_steps
FROM
  dataset.TestResults
GROUP BY
  test_name
HAVING
  count(*) <> count(comp_date)
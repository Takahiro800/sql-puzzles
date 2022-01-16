SELECT
  test_name
FROM
  dataset.TestResults
GROUP BY
  test_name
HAVING
  count(*) = count(comp_date)
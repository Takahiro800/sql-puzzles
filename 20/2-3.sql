SELECT
  DISTINCT test_name
FROM
  dataset.TestResults
WHERE
  comp_date IS NULL
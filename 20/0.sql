SELECT
  DISTINCT test_name
FROM
  dataset.TestResults AS T1
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      dataset.TestResults AS T2
    WHERE
      T2.comp_date IS NULL
      AND T1.test_name = T2.test_name
  )
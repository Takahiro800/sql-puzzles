SELECT
  *
FROM
  dataset.Consumers AS C1
WHERE
  fam IS NULL
  AND (
    SELECT
      count(*)
    FROM
      dataset.Consumers AS C2
    WHERE
      C2.address = C1.address
  ) > 1
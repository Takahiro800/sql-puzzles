SELECT
  person,
  CASE
    WHEN count(*) = 1 THEN max(role)
    ELSE 'B'
  END
FROM
  dataset.Roles
WHERE
  role IN ('D', 'O')
GROUP BY
  person
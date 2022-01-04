SELECT
  person,
  CASE
    WHEN min(role) <> max(role) THEN 'B'
    ELSE min(role)
  END AS combined_role
FROM
  dataset.Roles
WHERE
  role IN ('D', 'O')
GROUP BY
  person
SELECT
  R1.person,
  max(R1.role) AS role
FROM
  dataset.Roles AS R1
WHERE
  R1.role IN ('D', 'O')
GROUP BY
  R1.person
HAVING
  count(*) = 1
UNION
DISTINCT
SELECT
  R2.person,
  'B'
FROM
  dataset.Roles AS R2
WHERE
  r2.role IN ('D', 'O')
GROUP BY
  R2.person
HAVING
  count(*) = 2
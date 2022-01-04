SELECT
  R1.person,
  max(R1.role)
FROM
  dataset.Roles AS R1
WHERE
  R1.role IN ('D', 'O')
GROUP BY
  R1.person
HAVING
  count (DISTINCT R1.role) = 1
UNION
DISTINCT
SELECT
  R2.person,
  'B'
FROM
  dataset.Roles AS R2
WHERE
  R2.role IN ("D", "O")
GROUP BY
  R2.person
HAVING
  count(DISTINCT R2.role) = 2
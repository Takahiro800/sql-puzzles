-- errorが出た
SELECT
  DISTINCT R1.person,
  CASE
    WHEN EXISTS(
      SELECT
        count(*)
      FROM
        dataset.Roles AS R2
      WHERE
        R2.person = R1.person
        AND R2.role IN ('D', 'O')
      HAVING
        count(*) = 2
    ) THEN 'B'
    ELSE (
      SELECT
        DISTINCT R3.role
      FROM
        dataset.Roles AS R3
      WHERE
        R3.person = R1.person
        AND R3.role IN ('D', 'O')
    )
  END AS combine_role
FROM
  dataset.Roles AS R1
WHERE
  R1.role IN ('D', 'O')
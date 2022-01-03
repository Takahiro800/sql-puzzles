SELECT
  person,
  CASE
    WHEN count(*) = 2 THEN "B"
    ELSE min(role)
  END AS combined_role
FROM
  dataset.Roles
GROUP BY
  person
HAVING
  sum(
    CASE
      WHEN role = "X" THEN 0
      ELSE 1
    END
  ) > 0
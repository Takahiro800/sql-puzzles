SELECT
  person,
  SUBSTRING(
    'DOB'
    FROM
      sum(position(role IN 'DO')) FOR 1
  )
FROM
  dataset.Roles
WHERE
  role IN ('D', 'O')
GROUP BY
  person
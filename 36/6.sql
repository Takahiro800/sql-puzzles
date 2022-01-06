SELECT
  person,
  -- substrng( 'DOB' from sum(position (role in 'DO')) for 1  )
  substr(
    'DOB',
    sum(
      CASE
        WHEN contains_substr(role, 'D') THEN 1
        WHEN contains_substr(role, 'O') THEN 2
        ELSE 0
      END
    ),
    1
  ) AS office
FROM
  dataset.Roles
WHERE
  role IN ('D', 'O')
GROUP BY
  person
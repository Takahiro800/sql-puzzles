SELECT
  CASE
    WHEN item_a <= item_b THEN item_a
    ELSE item_b
  END AS s1,
  CASE
    WHEN item_a <= item_b THEN item_b
    ELSE item_a
  END AS s2,
  sum(pair_tally) AS pair_tally
FROM
  dataset.SalesSlips
GROUP BY
  s1,
  s2
ORDER BY
  s1,
  s2
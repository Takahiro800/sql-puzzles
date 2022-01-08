SELECT
  S0.item_a,
  S0.item_b,
  CASE
    -- WHEN max(S0.item_a) = max(S0.item_b) THEN max(S0.pair_tally)
    WHEN S0.item_a = S0.item_b THEN max(S0.pair_tally)
    ELSE sum(S0.pair_tally + S1.pair_tally)
  END AS pair_tally
FROM
  dataset.SalesSlips AS S0,
  dataset.SalesSlips AS S1
WHERE
  S0.item_a <= S0.item_b
  AND S0.item_a = S1.item_b
  AND S0.item_b = S1.item_a
GROUP BY
  S0.item_a,
  S0.item_b,
  S1.item_a,
  S1.item_b
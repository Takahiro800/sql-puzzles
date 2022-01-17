SELECT
  pilot
FROM
  dataset.PilotSkills AS PS
  CROSS JOIN dataset.Hangar AS H
WHERE
  PS.plane = H.plane
GROUP BY
  PS.pilot
HAVING
  count(PS.plane) = (
    SELECT
      count(*)
    FROM
      dataset.Hangar
  )
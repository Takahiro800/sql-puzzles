SELECT
  pilot
FROM
  dataset.PilotSkills AS PS
  LEFT JOIN dataset.Hangar AS H ON PS.plane = H.plane
GROUP BY
  PS.pilot
HAVING
  count(PS.plane) = (
    SELECT
      count(plane)
    FROM
      dataset.Hangar
  )
  AND count(H.plane) = (
    SELECT
      count(plane)
    FROM
      dataset.Hangar
  )
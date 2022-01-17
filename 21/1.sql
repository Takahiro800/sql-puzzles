-- error発生した
-- Error in query string: Error processing job 'sql-puzzles-336712:bqjob_r2ad7cd186a8a0fae_0000017e62bd9ba6_1': Correlated subqueries that reference other tables are not supported unless they can be de-correlated, such as by
SELECT
  DISTINCT pilot
FROM
  dataset.PilotSkills AS PS1
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      dataset.Hangar AS H
    WHERE
      NOT EXISTS (
        SELECT
          *
        FROM
          dataset.PilotSkills AS PS2
        WHERE
          (PS2.plane = H.plane)
          AND (PS1.pilot = PS2.pilot)
      )
  )
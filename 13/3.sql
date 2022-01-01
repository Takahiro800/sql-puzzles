SELECT
  CASE
    WHEN teacher_name = (
      SELECT
        min(teacher_name)
      FROM
        dataset.Register AS R1
      WHERE
        R1.course_nbr = R0.course_nbr
        AND R1.student_name = R0.student_name
    ) THEN course_nbr
    ELSE null
  END AS course_nbr_hdr,
  CASE
    WHEN teacher_name = (
      SELECT
        min(teacher_name)
      FROM
        dataset.Register AS R1
      WHERE
        R1.course_nbr = R0.course_nbr
        AND R1.student_name = R0.student_name
    ) THEN student_name
    ELSE null
  END AS student_name_hdr,
  teacher_name
FROM
  dataset.Register AS R0
ORDER BY
  course_nbr,
  student_name_hdr,
  teacher_name
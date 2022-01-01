SELECT
  course_nbr,
  student_name,
  min(teacher_name) AS first_teacher,
  CASE
    WHEN count(teacher_name) = 1 THEN NULL
    WHEN count(teacher_name) = 2 THEN max(teacher_name)
    ELSE '--More--'
  END AS other_teachers
FROM
  dataset.Register
GROUP BY
  course_nbr,
  student_name
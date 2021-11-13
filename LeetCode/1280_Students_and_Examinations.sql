SELECT t.student_id, student_name, t.subject_name, COUNT(Examinations.student_id) AS attended_exams
FROM
(
    SELECT student_id, student_name, subject_name
    FROM Students, Subjects
) t
LEFT JOIN Examinations ON t.student_id = Examinations.student_id AND t.subject_name = Examinations.subject_name
GROUP  BY t.student_id, t.subject_name
ORDER BY t.student_id, t.subject_name
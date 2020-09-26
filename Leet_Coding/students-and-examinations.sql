SELECT 
    student_exams.student_id,  student_exams.student_name, student_exams.subject_name, COUNT(Examinations.subject_name) AS attended_exams
FROM 
    (
        SELECT student_id, student_name, subject_name
        FROM Students, Subjects
        ORDER BY student_id
    ) student_exams
LEFT JOIN
    Examinations ON 
        student_exams.student_id = Examinations.student_id
            AND
        student_exams.subject_name = Examinations.subject_name
GROUP BY student_exams.student_id, student_exams.subject_name
ORDER BY student_exams.student_id, student_exams.subject_name


/*
1. INNER query gives all combinations of students and subjects. This is equivalent to a Cartesian product.
2. LEFT JOIN is used since we want to include all students who have appeared for exams and who havent appeared for exams. 
3. COUNT (DISTINCT Examinations.subject_name) is not used since we want to count all duplicate occcurences of appearances for exams.

A More optimized way of doing is not using a Sub-query.
*/

SELECT student.student_id,student.student_name,subject.subject_name,COUNT(exam.subject_name) as attended_exams
FROM Students as student
JOIN Subjects as subject
LEFT JOIN Examinations as exam
ON student.student_id=exam.student_id AND subject.subject_name=exam.subject_name
GROUP BY student.student_id,subject.subject_name
ORDER BY student_id,subject_name;
/** Solution 1 **/
SELECT dept_name, (
	SELECT COUNT(student_id) AS student_number
	FROM student
	WHERE student.dept_id = Department.dept_id
) student_number
FROM Department
ORDER BY 2 DESC


/* Solution 2 */
SELECT dept_name, COUNT(student_id) AS student_name
FROM department
LEFT JOIN student ON student.student_id = department.dept_id
GROUP BY dept_id
ORDER BY 2 DESC
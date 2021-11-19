SELECT project_id, Employee.employee_id
FROM Project
JOIN Employee ON Project.employee_id = Employee.employee_id
WHERE (project_id, experience_years) IN
(
    SELECT project_id, MAX(experience_years) 
    FROM Project
    JOIN Employee ON Project.employee_id = Employee.employee_id
    GROUP BY project_id
)
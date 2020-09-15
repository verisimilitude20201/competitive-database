SELECT 
    project_id, 
    Employee.employee_id
FROM Employee
INNER JOIN Project ON Employee.employee_id = Project.employee_id
WHERE 
    (project_id, experience_years) IN (
        SELECT 
            project_id, 
            MAX(experience_years) AS experience_years
        FROM Employee
        INNER JOIN Project ON Employee.employee_id = Project.employee_id
        GROUP BY project_id
    )

/*
1. Below INNER query selects project_id and maximum experience in years of any employee allocated to that project.

SELECT 
    project_id, 
    MAX(experience_years) AS experience_years
FROM Employee
INNER JOIN Project ON Employee.employee_id = Project.employee_id
GROUP BY project_id

2. Outer query just selects those project_id and employee_ids matching with (project_id, experience_years) tuple returned by inner query.

*/
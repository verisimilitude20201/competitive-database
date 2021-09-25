SELECT Department.Name AS Department, E1.Name As Employee, E1.Salary AS Salary
FROM Employee E1
INNER JOIN Department ON E1.DepartmentId = department.id 
WHERE 3 > (
	SELECT COUNT(DISTINCT E2.salary)
    FROM Employee E2
    WHERE E2.Salary > E1.Salary
) 
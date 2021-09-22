SELECT Department.Name AS Department, Employee.Name AS Employee, Salary FROM 
Employee 
INNER JOIN Department ON Employee.departmentId = Department.Id
WHERE (departmentId, Salary) IN
(
    SELECT departmentId, MAX(salary) AS Salary
    FROM Employee
    GROUP BY departmentId
)
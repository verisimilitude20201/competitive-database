/* ==> */ 

SELECT Department.Name AS Department,   E1.Name AS Employee , E1.Salary As Salary
FROM Employee E1
INNER JOIN Department ON E1.DepartmentId  = Department.Id
WHERE (E1.Salary, E1.DepartmentId) IN (SELECT MAX(Salary) AS Salary, Employee.DepartmentId
                   FROM Employee
                   GROUP BY Employee.DepartmentId)


/* The nested query gives the maximum salary per department ID. It also projects the department ID. The outer query checks for the tuple (Salary, Department) within the resultset returned 
by inner query.. */
SELECT Department, Employee, Salary
FROM 
(
    SELECT Department.Name As Department, Employee.Name AS Employee, Salary, DENSE_RANK() OVER (Partition By Department.Name ORDER BY Salary DESC) AS ranking
    FROM Employee INNER JOIN Department ON Employee.DepartmentId = Department.Id    
    ORDER BY Department, Salary DESC 
) top_three_salaries_per_department
WHERE ranking <= 3;

/*
1. The key to the solution is the DENSE_RANK() which computes an incremental rank for the salary for the partitions defined by the department name. The inner query does this job.
2. The Outer query selects only those tuples from the inner query where the ranking is <= 3. So it prints the 3 highest salaries for each department.
*/
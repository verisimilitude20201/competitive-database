With L1 AS (
	SELECT Employees.employee_id
	FROM Employees
	WHERE manager_id = 1 AND employee_id != 1
), L2 AS (
	SELECT Employees.employee_id
	FROM Employees
	INNER JOIN L1 ON Employees.manager_id = L1.employee_id
), L3 AS (
	SELECT Employees.employee_id
	FROM Employees
	INNER JOIN L2 ON Employees.manager_id = L2.employee_id
)
SELECT L1.employee_id 
FROM L1

UNION 

SELECT L2.employee_id 
FROM L2

UNION

SELECT L3.employee_id 
FROM L3

/*

1. First CTE retrieves first level reportees of manager 1.
2. Second CTR retrives second-level reportees of manager 1. They report directly report to first-level reportees.
3. Third CTE retrieves third-level reportees of manager 1. They report to the second-level reportees.


Another good way to do it is

*/

SELECT e1.employee_id
FROM Employees e1
JOIN Employees e2
ON e1.manager_id = e2.employee_id
JOIN Employees e3
ON e2.manager_id = e3.employee_id
WHERE e3.manager_id = 1 AND e1.employee_id != 1
/* 
LIMIT selects 1 record. OFFSET is used to select offset from the top of the resultset regarding which
record to return
*/

SELECT IFNULL(
        (SELECT DISTINCT Salary 
        FROM Employee
        ORDER BY Salary DESC
        LIMIT 1
        OFFSET 1), NULL 
) AS SecondHighestSalary
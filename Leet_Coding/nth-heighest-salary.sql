
/* ===> */ 

a. CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT(Salary) 
      FROM Employee UNION (SELECT NULL FROM Employee)
      ORDER BY Salary DESC
      LIMIT 1 OFFSET N
      
  );
END

/*The main clause here is LIMIT and OFFSET

LIMIT -> Limits the resultset to just one row.
OFFSET -> Skips over to just display the Nth row. The Union just does a plain union with NULL in case the first part of the query does not return anything.


b. Another way to do this is the below sub-query
*/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT emp1.id, emp1.name, emp1.Salary
      FROM Employee emp1
      where N = (SELECT COUNT(distinct(emp2.salary)) FROM Employee emp2 WHERE emp2.salary > emp1.salary);
  );
END

/* For each emp1.Salary, the correlated inner sub-query tries to find the (N - 1) highest salary and returns the count.  */
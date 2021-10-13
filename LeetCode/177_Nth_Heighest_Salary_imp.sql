/** Solution using LIMIT, OFFSET **/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE O INT;
  SET O=N - 1;
  RETURN (
      SELECT DISTINCT Salary
      FROM Employee
      ORDER BY Salary DESC
      LIMIT 1
      OFFSET O
      
  );
END

/*Solution using correlated nested query **/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE O INT;
  SET O=N - 1;
  RETURN (
      SELECT DISTINCT e1.Salary
      FROM Employee e1
      WHERE N - 1 = (SELECT COUNT(DISTINCT e2.Salary) FROM Employee e2 WHERE e1.Salary < e2.Salary)
      
  );
  
END
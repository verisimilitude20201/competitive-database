/* ==> */

a. SELECT MAX(Salary) AS SecondHighestSalary 
   FROM Employee
   WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee)


/* The inner query calculates the maximum salary for example: 300 from Employee. The Outer query is a form of SQL except which ignores the highest salary computed by the inner query and hence 
echoes 200 */



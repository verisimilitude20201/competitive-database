SELECT emp1.Name
FROM Employee emp1 
INNER JOIN Employee emp2 ON emp1.Id = emp2.ManagerId
GROUP BY emp1.id
HAVING COUNT(emp2.id) >= 5


/*

Applying a SELF JOIN on the manager splits the table into two copies

emp1 - Contains manager info
emp2 - Contains their direct reportee info.

We group by the manager's id and select only those tuples which have a count of the reportees at least 5. viz. >= 5

*/
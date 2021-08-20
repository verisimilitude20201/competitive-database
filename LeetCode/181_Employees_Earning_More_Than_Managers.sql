/*

Self join employees involving two copies of the same  table being opened in-memory.

e Copy
+----+-------+--------+-----------+                                                     
| Id | Name  | Salary | ManagerId |   
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+

Mgr Copy

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
INNER JOIN selects Employee attributes from the e copy and manager attributes from mgr copy.
Where clause selects those tuples where the employee salary is greater than manager salary.

*/

SELECT e.Name AS Employee 
FROM Employee mgr
INNER JOIN Employee e ON mgr.Id = e.ManagerId
WHERE e.Salary > mgr.Salary
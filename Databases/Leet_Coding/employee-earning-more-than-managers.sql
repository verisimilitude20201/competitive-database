/* ==> */ 

SELECT E2.Name As Employee
FROM Employee E1, Employee E2
WHERE E1.Id = E2.ManagerId
AND E1.Salary < E2.Salary

/* E1's copy of the table means managers. E2's copy of the table means normal employees. Just take self-join and compare E2's salary with E1.  */
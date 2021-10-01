SELECT E2.Name AS Name
FROM Employee E1, Employee E2
WHERE E1.ManagerId = E2.Id
GROUP BY E1.ManagerId
HAVING COUNT(E1.Id) >= 5
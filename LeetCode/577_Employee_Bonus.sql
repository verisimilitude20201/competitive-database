SELECT name, bonus
FROM Employee
LEFT JOIN Bonus ON Employee.empId = Bonus.empId
WHERE Bonus.bonus is NULL or Bonus.bonus < 1000
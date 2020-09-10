/* ===> */ 

SELECT name, Bonus.bonus
FROM employee
LEFT OUTER JOIN Bonus ON employee.empId  = Bonus.empId
WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL
SELECT 
	name, 
	SUM(amount) AS balance
FROM Users
INNER JOIN Transactions Using(account)
GROUP BY name
HAVING balance > 10000
ORDER BY name
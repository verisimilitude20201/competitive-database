SELECT id, name 
FROM Accounts WHERE id IN (
	SELECT DISTINCT L1.id
	FROM Logins L1 
	JOIN Logins L2 ON L1.id = L2.id
 	WHERE DATEDIFF(L2.login_date, L1.login_date) BETWEEN 1 and 4
	GROUP BY L1.id, L1.login_date
	HAVING COUNT(DISTINCT L2.login_date) = 4
)
ORDER BY id;

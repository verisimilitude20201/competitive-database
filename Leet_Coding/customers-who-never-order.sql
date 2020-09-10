/* ===> */

SELECT Name AS Customers
FROM Customers WHERE Id Not IN (SELECT CustomerId From Orders);

/* Inner query selects customer IDs from Orders. Outer query selects those customers whose ids are not present in the result-set returned by the inner query.  */
SELECT Name AS `Customers` 
FROM Customers
WHERE Id NOT IN (
    SELECT DISTINCT CustomerId FROM Orders
);
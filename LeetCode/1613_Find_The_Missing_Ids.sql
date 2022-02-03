With Recursive seq AS (
    SELECT 1 AS `value` UNION ALL SELECT value + 1 FROM seq WHERE value < (SELECT MAX(customer_id) FROM Customers)
    
    

)
SELECT value as ids 
FROM seq
WHERE value NOT IN (SELECT customer_id FROM Customers)
ORDER BY 1 ASC;
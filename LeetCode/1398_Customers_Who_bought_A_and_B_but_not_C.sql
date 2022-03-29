With Customers_Who_bought_both_products AS (
	SELECT DISTINCT O1.customer_id
    FROM Orders O1
    JOIN Orders O2 ON O1.customer_id = O2.customer_id
    WHERE O1.product_name = 'A' AND O2.product_name = 'B'
)
SELECT Customers_Who_bought_both_products.customer_id, customer_name 
FROM Customers_Who_bought_both_products
JOIN Customers ON Customers_Who_bought_both_products.customer_id = Customers.customer_id
WHERE Customers_Who_bought_both_products.customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders WHERE product_name = 'C')
ORDER BY Customers_Who_bought_both_products.customer_id

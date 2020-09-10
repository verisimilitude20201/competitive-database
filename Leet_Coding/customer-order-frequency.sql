With customers_greater_than_100 AS (
    SELECT customer_id, SUM(price * quantity) AS cost, MONTH(order_date) AS month
    FROM Orders INNER JOIN Product ON Orders.product_id = Product.product_id
    GROUP BY customer_id, MONTH(order_date)
    HAVING SUM(price * quantity) >= 100
)
SELECT c1.customer_id, c.name
FROM customers_greater_than_100 c1  
INNER JOIN customers_greater_than_100 c2 ON c1.customer_id = c2.customer_id
INNER JOIN customers c ON c1.customer_id = c.customer_id
WHERE c1.month = 6 AND c2.month = 7;


/*
1. The CTE gives an aggregate of total cost per customer per month. It selects only those tuples where the cost is at least $100
2. The second query uses the result-set derived from the CTE. It takes an SELF JOIN between two instances of the CTE on customer_id and selects those records for which the month is June 
and July. 

3. Another INNER JOIN has been added with customer table to select the name of the customer. 
*/
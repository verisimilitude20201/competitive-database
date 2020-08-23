/* ==> */

With max_date_per_order AS (
    SELECT MAX(order_date) AS order_date, product_id
    FROM Orders 
    GROUP BY product_id
) 
SELECT Products.product_name, Products.product_id, Orders.order_id, Orders.order_date
FROM Orders
INNER JOIN Products ON Orders.product_id = Products.product_id
WHERE (Orders.product_id, Orders.order_date) IN (SELECT max_date_per_order.product_id, max_date_per_order.order_date FROM max_date_per_order)
ORDER BY Products.product_name, Products.product_id, Orders.order_id

/*
1. The max_date_per_order selects max order dates for each product_id
2. Then, we apply a simple JOIN query between Orders and Products and apply a WHERE clause that filters in only the recent dates per product_id queried from the max_date_per_order

*/
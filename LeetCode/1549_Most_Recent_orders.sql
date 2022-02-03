With Recent_Orders AS (
    SELECT product_id, MAX(order_date) AS order_date
    FROM orders
    GROUP BY product_id

)
SELECT Products.product_name, Orders.product_id, Orders.order_id, Orders.order_date 
FROM Orders
JOIN Recent_Orders ON Orders.product_id = Recent_Orders.product_id AND Orders.order_date = Recent_orders.order_date
JOIN Products ON Orders.product_id = Products.product_id
ORDER BY product_name, product_id, order_id;
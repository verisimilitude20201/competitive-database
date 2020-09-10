SELECT products.product_name, SUM(unit) AS unit
FROM Orders
INNER JOIN Products ON products.product_id = orders.product_id
WHERE Month(order_date) = 2
GROUP BY products.product_id, MONTH(order_date)
HAVING SUM(unit) >= 100;
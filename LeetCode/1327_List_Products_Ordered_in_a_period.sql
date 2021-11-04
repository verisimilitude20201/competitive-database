SELECT product_name,  SUM(unit) AS unit
FROM Orders
JOIN Products ON Orders.product_id = Products.product_id
WHERE DATE_FORMAT(order_date, "%Y-%m") = "2020-02"
GROUP BY Products.product_id
HAVING unit >= 100
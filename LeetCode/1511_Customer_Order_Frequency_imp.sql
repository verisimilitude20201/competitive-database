SELECT customer_id, name
FROM Customers 
WHERE customer_id IN (

    SELECT customer_id
    FROM Orders
    JOIN Product ON Orders.product_id = Product.product_id
    GROUP BY customer_id
    HAVING SUM(Product.price * IF(DATE_FORMAT(order_date, "%Y-%m") = "2020-06", Orders.quantity, 0 )) >= 100 AND SUM(Product.price * IF(DATE_FORMAT(order_date, "%Y-%m") = "2020-07", Orders.quantity, 0 )) >= 100

);
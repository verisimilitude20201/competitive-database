SELECT Sales.product_id, SUM(quantity) AS total_quantity
FROM Product
JOIN Sales ON Product.product_id = Sales.product_id
GROUP BY Sales.product_id
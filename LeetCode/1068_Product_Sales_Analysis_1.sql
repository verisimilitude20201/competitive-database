SELECT product_name, year, price
FROM Sales
JOIN Product ON Sales.product_id = product.product_id
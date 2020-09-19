SELECT Product.product_id, product_name
FROM Product
INNER JOIN Sales ON Product.product_id = Sales.product_id
GROUP BY Sales.product_id
HAVING SUM(sale_date < "2019-01-01" OR sale_date > "2019-03-31") = 0
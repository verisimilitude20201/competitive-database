SELECT Prices.product_id, ROUND(SUM(price * units) / SUM(units), 2) AS average_price
FROM prices INNER JOIN UnitsSold ON Prices.product_id = UnitsSold.product_id
WHERE purchase_date BETWEEN start_date AND end_date
GROUP BY Prices.product_id
SELECT Prices.product_id, ROUND(SUM(price * units) / SUM(units), 2) AS average_price
FROM Prices
JOIN UnitsSold On Prices.product_id = UnitsSold.product_id AND (UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date)
GROUP BY Prices.product_id; 
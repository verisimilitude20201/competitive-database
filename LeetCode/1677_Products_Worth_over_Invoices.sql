SELECT name, IF(rest is NOT NULL, SUM(rest), 0) AS rest, IF(paid is NOT NULL, SUM(paid), 0) AS paid, IF(canceled is NOT NULL, SUM(canceled), 0) AS canceled, IF(refunded is NOT NULL, SUM(refunded), 0) AS refunded
FROM Product
LEFT JOIN Invoice ON Product.product_id = Invoice.product_id
GROUP BY name
ORDER BY name
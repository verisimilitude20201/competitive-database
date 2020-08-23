SELECT IFNULL(ROUND((COUNT(D1.delivery_id) / D2.total_orders) * 100, 2), 0.0000) AS immediate_percentage 
FROM Delivery D1, (SELECT COUNT(delivery_id) AS total_orders FROM Delivery) D2
WHERE D1.order_date = D1.customer_pref_delivery_date 



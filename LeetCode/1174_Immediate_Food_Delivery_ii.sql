# Write your MySQL query statement below


SELECT  (ROUND(100 * SUM(IF(Delivery.order_date=Delivery.customer_pref_delivery_date,1, 0)) / COUNT(DISTINCT Delivery.customer_id), 2)) AS immediate_percentage
FROM (
    SELECT customer_id, MIN(order_date) AS order_date  
    FROM Delivery
    GROUP BY customer_id
) min_order_date
JOIN Delivery ON (min_order_date.customer_id = Delivery.customer_id AND min_order_date.order_date = Delivery.order_date)

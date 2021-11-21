# Write your MySQL query statement below
SELECT Users.user_id AS buyer_id, join_date, SUM(IF(DATE_FORMAT(order_date,"%Y") = 2019, 1, 0)) AS orders_in_2019
FROM Users 
LEFT JOIN Orders ON Users.user_id = Orders.buyer_id
GROUP BY Users.user_id
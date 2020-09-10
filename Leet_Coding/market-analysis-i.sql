SELECT user_id AS buyer_id, join_date, SUM(IF(order_date IS NOT NULL AND DATE_FORMAT(order_date, "%Y")=2019, 1, 0)) AS orders_in_2019
FROM Users LEFT JOIN Orders ON users.user_id = Orders.buyer_id
GROUP BY user_id
ORDER BY buyer_id
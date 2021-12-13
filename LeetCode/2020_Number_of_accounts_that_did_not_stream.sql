# Write your MySQL query statement below
SELECT COUNT(DISTINCT Subscriptions.account_id) AS accounts_count
FROM Subscriptions
LEFT JOIN Streams ON Subscriptions.account_id = Streams.account_id
WHERE DATE_FORMAT(end_date, "%Y") = 2021 AND DATE_FORMAT(stream_date, "%Y") != 2021 ;
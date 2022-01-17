# Write your MySQL query statement below
SELECT IFNULL(ROUND(AVG(t.session_cnt), 2), 0) AS average_sessions_per_user
FROM (
    SELECT user_id, COUNT(DISTINCT session_id) AS session_cnt FROM Activity
    WHERE activity_date >= "2019-06-28" AND activity_date <= "2019-07-27"
    GROUP BY user_id
) t

SELECT ROUND(COUNT(DISTINCT session_id)/greatest(1, COUNT(DISTINCT user_id)), 2) average_sessions_per_user
FROM Activity 
WHERE activity_date between '2019-06-28' and '2019-07-27' 
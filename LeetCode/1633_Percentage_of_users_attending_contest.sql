# Write your MySQL query statement below
With total_users AS (
    SELECT COUNT(user_id) AS u_cnt
    FROM Users
)
SELECT contest_id, ROUND((COUNT(user_id) / (SELECT COUNT(user_id) FROM Users)) * 100, 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY 2 DESC, 1 ASC
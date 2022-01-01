SELECT t.activity_date AS login_date, COUNT(t.user_id) AS user_count
FROM (
    SELECT user_id, MIN(activity_date) AS activity_date 
    FROM Traffic
    WHERE activity="login"
    GROUP BY user_id
    HAVING DATEDIFF("2019-06-30", activity_date) <= 90
) t
GROUP BY t.activity_date
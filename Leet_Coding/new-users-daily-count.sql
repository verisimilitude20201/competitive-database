SELECT activity_date AS login_date, COUNT(user_id) AS user_count
FROM (
    SELECT user_id, activity, MIN(activity_date) AS activity_date
    FROM Traffic
    WHERE activity='login'
    GROUP BY user_id
    HAVING activity_date between date_add('2019-06-30', interval -90 day) and '2019-06-30'
) first_login

GROUP BY activity_date


/*

1. The INNER query gives the first activity date for every login. Note the WHERE activity='login' is very important here..

SELECT user_id, activity, MIN(activity_date) AS activity_date
FROM Traffic
WHERE activity='login'
GROUP BY user_id
HAVING activity_date between date_add('2019-06-30', interval -90 day) and '2019-06-30'


2. Outer query just computes the COUNT() of users that login on the said activity date form INNER query.


*/ 
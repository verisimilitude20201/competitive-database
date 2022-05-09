# Write your MySQL query statement below
With t0 AS (
    SELECT contest_id, gold_medal as user_id
    FROM Contests
    
    UNION ALL
    
    SELECT contest_id, silver_medal as user_id
    FROM Contests
    
    UNION ALL
    
    SELECT contest_id, bronze_medal as user_id
    FROM Contests
    
),
t1 AS (

    SELECT user_id, contest_id, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY contest_id) AS rn
    FROM t0

), t2 AS (
    SELECT user_id AS user
    FROM t1
    GROUP BY user_id, contest_id - rn
    having count(*) >= 3
    
    UNION 
    
    SELECT gold_medal AS user
    FROM contests 
    GROUP BY 1
    HAVING COUNT(contest_id) >= 3
)
SELECT name, mail 
FROM Users
JOIN t2 ON Users.user_id = t2.user
ORDER BY name
With activity_cnt AS (
    SELECT activity, COUNT(id) AS cnt
    FROM Friends
    GROUP BY activity
)
SELECT activity
FROM activity_cnt 
WHERE cnt NOT IN
(
    (
        SELECT MAX(cnt)
        FROM activity_cnt
    ),
    (
        SELECT MIN(cnt)
        FROM activity_cnt
    )
) 

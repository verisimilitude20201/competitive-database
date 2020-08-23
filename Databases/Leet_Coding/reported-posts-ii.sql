/* ===> */

SELECT ROUND(AVG(average_p), 2) AS average_daily_percent
FROM (
    SELECT action_date, (COUNT(DISTINCT Removals.post_id) / COUNT(DISTINCT Actions.post_id) * 100) AS average_p
    FROM Actions
    LEFT JOIN Removals ON Actions.post_id = Removals.post_id
    WHERE action='report' AND extra='spam'
    GROUP BY action_date
) daily_percentage

/*
1. Inner query finds a percentage of count of removed posts with the count of posts that have been requested to be removed.
2. Outer query finds the average of the percentages returned from inner query.
*/
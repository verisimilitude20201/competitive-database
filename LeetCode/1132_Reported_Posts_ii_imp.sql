SELECT ROUND(AVG(t.removal_percent), 2) AS average_daily_percent 
FROM (
	SELECT (COUNT(DISTINCT Removals.post_id) / COUNT(DISTINCT Actions.post_id)) * 100 AS removal_percent
FROM Actions 
LEFT JOIN Removals ON Actions.post_id = Removals.post_id
WHERE action="report" AND extra="spam"
GROUP BY action_date
) t


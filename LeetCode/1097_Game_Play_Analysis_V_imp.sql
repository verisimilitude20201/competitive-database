SELECT A.event_date AS install_dt,  COUNT(A.player_id) AS installs, ROUND(COUNT(B.player_id) / COUNT(A.player_id), 2) AS Day1_Retention
FROM (
	SELECT player_id, MIN(event_date) AS event_date
	FROM Activity
	GROUP BY player_id) A
LEFT JOIN Activity B ON A.player_id = B.player_id AND A.event_date = DATE_SUB(B.event_date, INTERVAL 1 DAY) 
GROUP BY A.event_date
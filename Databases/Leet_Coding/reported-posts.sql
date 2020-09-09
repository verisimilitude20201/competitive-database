SELECT extra AS report_count, COUNT(DISTINCT post_id) AS report_reason 
FROM Actions
WHERE action_date + INTERVAL 1 DAY = DATE("2019-07-05") AND action="report"
GROUP BY extra
ORDER BY 1
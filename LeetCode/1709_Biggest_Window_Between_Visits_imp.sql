With Dates_Between_Time_Windows AS (
	SELECT UV1.user_id, UV1.visit_date, MIN(IFNULL(UV2.visit_date, STR_TO_DATE("2021-01-01", "%Y-%m-%d"))) AS next_date
	FROM UserVisits UV1
	LEFT JOIN UserVisits UV2 ON UV1.user_id = UV2.user_id AND UV1.visit_date < UV2.visit_date
	GROUP BY UV1.user_id, UV1.visit_date
)
SELECT user_id, MAX(DATEDIFF(next_date, visit_date)) AS biggest_window 
FROM Dates_Between_Time_Windows
GROUP BY user_id
ORDER BY user_id
With CTF1 AS (
	SELECT SignUps.user_id, SUM(IF(action="timeout", 1, 0)) AS time_out_count, SUM(IF(action="confirmed", 1, 0)) AS confirm_count
	FROM SignUps 
	LEFT JOIN Confirmations ON SignUps.user_id = Confirmations.user_id
	GROUP BY SignUps.user_id
) 
SELECT user_id, 
	(
		CASE
			WHEN confirm_count=0 AND time_out_count=0 THEN 0.00
			ELSE
				ROUND(confirm_count / (time_out_count + confirm_count), 2) 
			END
	) AS confirmation_rate         
FROM CTF1;
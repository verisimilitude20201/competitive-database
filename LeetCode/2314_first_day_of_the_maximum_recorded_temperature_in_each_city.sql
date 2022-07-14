With max_w AS 
	(
		SELECT city_id, MAX(degree) AS max_weather
		FROM Weather
        GROUP BY city_id
	)

SELECT Weather.city_id,  MIN(day) AS day, degree
FROM Weather
JOIN max_w ON Weather.city_id = max_w.city_id AND Weather.degree = max_w.max_weather
GROUP BY Weather.city_id, degree
ORDER BY 1;
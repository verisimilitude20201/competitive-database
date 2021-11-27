SELECT country_name, 
(
    CASE 
       WHEN AVG(weather_state) <= 15 Then "Cold"
       WHEN AVG(weather_state) >= 25 Then "Hot"
       ELSE "Warm"
    END
) weather_type 
   
FROM Countries 
LEFT JOIN Weather ON  Countries.country_id = Weather.country_id
WHERE DATE_FORMAT(day, "%Y-%m") = "2019-11" 
GROUP BY Countries.country_id
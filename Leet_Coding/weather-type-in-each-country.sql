With avg_weather_state AS
(
    SELECT country_name, day, AVG(weather_state) AS weather_state
    FROM Countries INNER JOIN weather ON Countries.country_id = weather.country_id
    GROUP BY country_name, DATE_FORMAT(day, '%Y-%m')
    HAVING DATE_FORMAT(day, '%Y-%m') = '2019-11'
)
SELECT country_name, 
(
    CASE 
        WHEN weather_state <= 15 THEN "Cold"
        WHEN weather_state >= 25 THEN "Hot"
        ELSE "Warm"
   END       
        
) weather_type
FROM avg_weather_state
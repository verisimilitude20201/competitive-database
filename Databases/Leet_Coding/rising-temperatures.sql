 

a. PostgreSQL solution

SELECT
    weather.id AS Id
FROM
    weather
        inner JOIN
    weather w ON date_part('day', weather.RecordDate::timestamp - w.RecordDate::timestamp) = 1
        AND weather.Temperature > w.Temperature

date_part function is used to compute the difference between dates. It computes the difference between dates in days. Self-join is issued between two copies of the table by taking the difference 
of dates in the number of days. If it is equal to 1, its corresponding temperatures are compared. 


b. MySQL solution.
This is on similar lines but uses DATE_DIFF

SELECT
    weather.id AS 'Id'
FROM
    weather
        JOIN
    weather w ON DATEDIFF(weather.RecordDate, w.RecordDate) = 1
        AND weather.Temperature > w.Temperature
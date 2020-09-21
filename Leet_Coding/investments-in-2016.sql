SELECT SUM(TIV_2016) AS TIV_2016
FROM insurance 
WHERE TIV_2015 IN (
    SELECT TIV_2015
    FROM insurance
    GROUP BY TIV_2015
    HAVING COUNT(TIV_2015) >= 2
) AND (LAT, LON) IN (
    SELECT LAT, LON
    FROM insurance
    GROUP BY CONCAT(LAT, LON)
    HAVING COUNT(CONCAT(LAT, LON)) = 1
)


/*

1. Selects all those TIV_2015 which have the value of TIV_2015 same as at least one or more policy holders

SELECT TIV_2015
    FROM insurance
    GROUP BY TIV_2015
    HAVING COUNT(TIV_2015) >= 2

2. Select all latitudes and longitudes which are unique

SELECT LAT, LON
    FROM insurance
    GROUP BY CONCAT(LAT, LON)
    HAVING COUNT(CONCAT(LAT, LON)) = 1

*/
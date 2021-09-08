/*
Here since we need a NULL output when no such number exists, we have used MAX. MAX() used on a resultset with no records returns a NULL value.
**/

SELECT MAX(t.num) AS num
FROM 
(
    SELECT num
    FROM my_numbers
    GROUP BY num
    HAVING COUNT(num) = 1
) t
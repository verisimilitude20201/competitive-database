With low_rating AS (
    SELECT query_name, COUNT(query_name) AS rating
    FROM Queries
    WHERE rating < 3
    GROUP BY query_name
)

SELECT Queries.query_name, ROUND(AVG(Queries.rating / position), 2) AS quality, 
IF(low_rating.rating IS NULL, 
   0.00, 
   ROUND(low_rating.rating / COUNT(Queries.query_name) * 100, 2)) 
   AS poor_query_percentage
FROM Queries
LEFT JOIN low_rating ON Queries.query_name = low_rating.query_name
GROUP BY Queries.query_name


/*

1. The CTF gives the COUNT() of those rows who have low rating i.e. where rating < 3
2. We LEFT JOIN this with the Queries table on 'query_name'. 
    i. CTF will not select those queries for which there is no rating < 3. For those queries, the poor percentage will be 0.00
    ii. Therefore, we incorporate the poor percentage calculation within MySQL IF Loop. If its NULL, return 0 else compute the percentage.

*/
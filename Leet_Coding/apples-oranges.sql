SELECT sale_date, 
SUM(CASE WHEN fruit='apples' THEN sold_num ELSE -sold_num END) as diff 
FROM Sales
GROUP BY sale_date 


/*

The trick is returning -sold_num whenever oranges are selected. Applying the SUM on the difference gives the difference of apples - oranges GROUP BY the sale date.

*/
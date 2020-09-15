SELECT 
    product_id, 
    year AS first_year, 
    quantity, 
    price
FROM Sales
WHERE 
    (product_id, year) 
        IN (
            SELECT 
               product_id, 
               MIN(year) AS year
            FROM Sales
            GROUP BY product_id
        );

/*

1. Sub-query selects those product ids with the first year when they got purchased
2. Outer query selects the price, quantity for the product ids and the year returned by the INNER query 

*/
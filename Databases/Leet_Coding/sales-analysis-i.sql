/* ===>   */

SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) >= (
    SELECT MAX(price) FROM (
        SELECT SUM(price) AS price
        FROM Sales
        GROUP BY seller_id
    ) max_price
); 


/* 1. This computes the sum of price by seller */
SELECT SUM(price) AS price
FROM Sales
GROUP BY seller_id


/* 2. This computes the max of that sum */
SELECT MAX(price) FROM (

) max_price

/* 3. The outermost query prints the seller ids of those sellers whose sum is equal to that computed by step 2*/

SELECT buyer_id
FROM Sales
INNER JOIN Product ON Sales.product_id = product.product_id
GROUP BY buyer_id
HAVING (
    SUM(CASE WHEN product_name='S8' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN product_name='iPhone' THEN 1 ELSE 0 END) = 0
)

/*

The crux of the solution is 


SUM(CASE WHEN product_name='S8' THEN 1 ELSE 0 END) > 0
    AND
SUM(CASE WHEN product_name='iPhone' THEN 1 ELSE 0 END) = 0

1. Given data

Consider what data we have
================================================================
Product table:
+------------+--------------+------------+
| product_id | product_name | unit_price |
+------------+--------------+------------+
| 1          | S8           | 1000       |
| 2          | G4           | 800        |
| 3          | iPhone       | 1400       |
+------------+--------------+------------+

buyer_id         product_name
1                   S8  
2                   G4
3                   S8
3                   iPhone 
================================================================

2. Applying the two CASE constructs, it gives rise to below resultset

buyer_id         product_id   CASE_S8         CASE_IPhone                 
1                   1           1                0
3                   1           1                0
3                   3           0                1  


3. Applying the GROUP BY on buyer_id and SUM()

buyer_id         product_id   CASE_S8         CASE_IPhone                 
1                   1           1                0
3                   1           1                1

4. Again applying the condition in the HAVING clause

SUM(CASE WHEN product_name='S8' THEN 1 ELSE 0 END) > 0
    AND
SUM(CASE WHEN product_name='iPhone' THEN 1 ELSE 0 END) = 0

buyer_id         product_id   CASE_S8         CASE_IPhone                 
1                   1           1                0


*/
SELECT DISTINCT(buyer_id)
FROM
    (SELECT buyer_id FROM Sales JOIN Product USING(product_id) WHERE product_name = "S8" ) A
LEFT JOIN     
    (SELECT buyer_id FROM Sales JOIN Product USING(product_id) WHERE product_name = "iPhone" ) B USING(buyer_id)
WHERE B.buyer_id IS NULL;

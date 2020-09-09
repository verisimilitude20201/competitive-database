SELECT
    ROUND(100*SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1
    ELSE 0 END)/ COUNT(distinct customer_id) ,2) AS immediate_percentage
FROM
    Delivery
WHERE
    (customer_id, order_date)
IN
(SELECT
    customer_id, min(order_date) as min_date
FROM
    Delivery
GROUP BY
    customer_id
); 


/*

1. The inner query gives (customer_id, order_date) combination for each customer where the order date is the first order of the customer. 

SELECT customer_id, min(order_date) as min_date
FROM  Delivery
GROUP BY customer_id

2. The Outer query checks matches (customer_id, order_date) only for the tuples returned by sub-query and computes the percentage accordingly.

Note:
-------

A common mistake here is the query of this kind:

SELECT customer_id, min(order_date) as min_date, customer_pref_delivery_date
FROM Delivery
GROUP BY customer_id

This may not select 'customer_pref_delivery_date' related to 'min_date'


*/
SELECT customer_name, customer_id, order_id, order_date
FROM 
(
    SELECT name AS customer_name, Customers.customer_id, order_id, order_date, (row_number() over (partition by  Customers.customer_id order by order_date DESC)) AS rownum
    FROM Customers
    INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
    ORDER BY customer_name, Customers.customer_id, order_date DESC
 
) latest_orders
WHERE rownum <= 3


/*

The row_number() over (partition by  Customers.customer_id order by order_date DESC) 

i.  Partitions the resultset into groups of customer_ids
ii. Orders them order_date DESC
iii. Applies the row_number() function on them.  

*/
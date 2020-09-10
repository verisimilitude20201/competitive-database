SELECT O1.customer_id, C.customer_name
FROM Orders O1 
INNER JOIN Orders O2 ON O1.customer_id   = O2.customer_id
INNER JOIN Customers C ON O1.customer_id = C.customer_id 
WHERE O1.product_name = 'A' AND O2.product_name='B' AND O1.customer_id NOT IN (
    SELECT customer_id 
    FROM Orders
    WHERE product_name = 'C'
)
ORDER BY O1.customer_id


/*
1. The first key is we join two instances of Order table by customer_id. We then compare the product_names of both instances, O1 and O2 if they equal A and B respectively.
2. From the data in 1, we subtract those customer_ids who have purchased product C. 
3. The final step is easy, we do an INNER JOIN with Customers because We need the customer name. 

*/
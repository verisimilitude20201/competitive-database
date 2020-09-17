SELECT 
    name
FROM salesperson
WHERE 
    sales_id NOT IN  (
        SELECT 
            sales_id 
        FROM Orders
        WHERE
            com_id IN (
                SELECT com_id
                FROM company
                WHERE name='RED'
            )
    )


/*
Looking at this from inside out

1. First inner query select com_id for company whose name is RED.

SELECT com_id
FROM company
WHERE name='RED'


2. Below query selects sales_id for those salesman who sold orders of company "RED"

SELECT 
    sales_id 
FROM Orders
WHERE
    com_id IN (
        SELECT com_id
        FROM company
        WHERE name='RED'
    )

3. Third query selects names of salesperson who did not sell orders to company "RED"

SELECT 
    name
FROM salesperson
WHERE 
    sales_id NOT IN  ( // 2nd query)


*/

/* A more efficient way for this is to use RIGHT JOIN */

select salesperson.name
from orders o join company c on (o.com_id = c.com_id and c.name = 'RED')
right join salesperson on salesperson.sales_id = o.sales_id
where o.sales_id is null

/*

1. The first join selects the orders that were sent to company RED

select salesperson.name
from orders o join company c on (o.com_id = c.com_id and c.name = 'RED')

2. The second RIGHT join with sales person chooses selects sales persons who have sold orders to company RED. The

right join salesperson on salesperson.sales_id = o.sales_id
where o.sales_id is null

The WHERE o.sales_id IS NULL restricts the resultset to those salespersons that have not sold any order to company "RED"


*/
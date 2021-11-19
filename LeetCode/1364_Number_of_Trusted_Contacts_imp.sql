# Write your MySQL query statement below
SELECT t.invoice_id, t.customer_name, t.price, COUNT(C1.user_id) AS contacts_cnt, COUNT(C2.email) AS trusted_contacts_cnt
FROM (
    SELECT invoice_id, customer_name, price, email, customer_id
    FROM invoices
    INNER JOIN Customers ON invoices.user_id = Customers.customer_id
) t
LEFT JOIN Contacts C1 ON  t.customer_id = C1.user_id
left join customers c2 on c2.email = c1.contact_email
GROUP BY t.invoice_id, t.customer_name, t.price
ORDER BY t.invoice_id;
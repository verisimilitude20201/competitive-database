SELECT seller_name
FROM Seller
WHERE seller_id NOT IN (
    SELECT DISTINCT seller_id
    FROM Orders
    WHERE DATE_FORMAT(sale_date, "%Y") = 2020

)
ORDER BY seller_name ASC;
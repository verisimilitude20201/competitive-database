SELECT Books.book_id
FROM Books
JOIN Orders ON Books.book_id = Orders.book_id
WHERE DATE(dispatch_date) BETWEEN "2018-06-23" AND "2019-06-23"
GROUP BY Orders.book_id
HAVING SUM(quantity) >= 10
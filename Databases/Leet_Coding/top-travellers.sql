/* ===> */

SELECT name, SUM(IFNULL(distance, 0)) AS travelled_distance
FROM Users LEFT JOIN Rides ON Users.id = Rides.user_id
GROUP BY Rides.user_id
ORDER BY SUM(distance) DESC, name ASC

/*
User 'donald' has not travelled any distance. Since, we have taken LEFT JOIN, the result-set will contain all rows from Users table. The distance column for 'donald' will be NULL.
SUM(NULL) is NULL. Therefore, we apply the IFNULL function.
*/
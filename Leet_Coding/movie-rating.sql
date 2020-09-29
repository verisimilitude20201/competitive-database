(SELECT Users.name AS results
FROM Users
INNER JOIN Movie_Rating ON Users.user_id = Movie_Rating.user_id
GROUP BY Users.name
ORDER BY COUNT(movie_id) DESC, Users.name ASC
LIMIT 1)

UNION

(SELECT Movies.title AS results
FROM Movies
INNER JOIN Movie_Rating ON Movies.movie_id = Movie_Rating.movie_id
WHERE MONTH(created_at) = 02
GROUP BY Movies.title
ORDER BY AVG(rating) DESC, Movies.title ASC
LIMIT 1)
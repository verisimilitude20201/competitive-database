(
    SELECT u.name AS results
FROM Users u
JOIN Movie_Rating mr ON u.user_id = mr.user_id
GROUP BY mr.user_id
ORDER BY COUNT(movie_id) DESC, u.name ASC
LIMIT 1)

UNION


(
    SELECT m.title AS results
    FROM Movies m
    JOIN Movie_Rating mr ON m.movie_id = mr.movie_id
    WHERE DATE_FORMAT(created_at, "%Y-%m") = "2020-02"
    GROUP BY mr.movie_id 
    ORDER BY AVG(rating) DESC, m.title ASC
    LIMIT 1
)
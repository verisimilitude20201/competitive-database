SELECT DISTINCT page_id AS recommended_page 
FROM (
    SELECT user1_id, user2_id 
    FROM Friendship
        UNION
    SELECT user2_id, user1_id 
    FROM Friendship
) t
JOIN Likes ON t.user2_id = Likes.user_id
WHERE t.user1_id = 1 AND page_id NOT IN (
    SELECT page_id FROM Likes WHERE user_id = 1
)

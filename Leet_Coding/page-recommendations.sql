With friends_of_user_id1 AS (
	
	SELECT user2_id AS friend_id FROM Friendship  WHERE user1_id = 1

	UNION

	SELECT user1_id AS friend_id FROM Friendship  WHERE user2_id = 1

)

SELECT DISTINCT(page_id) AS recommended_page 
FROM Likes
INNER JOIN friends_of_user_id1 ON Likes.user_id = friends_of_user_id1.friend_id
WHERE page_id NOT IN (SELECT DISTINCT(page_id) FROM Likes WHERE user_id = 1);

/*
1. The CTE finds the friends of user_id = 1. user1_id can be a friend of many user2_ids.  Similarly the other way round. So a UNION is used.
2. The second query joins the CTE with user_id in Likes table. It skips those pages already liked by user_id 1.

*/
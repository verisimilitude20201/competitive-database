With C AS (
	SELECT l1.user_id AS u1, l2.user_id AS u2, COUNT(DISTINCT l1.song_id) AS sngcnt
	FROM Listens l1
	JOIN Listens l2 ON l1.day = l2.day AND l1.song_id = l2.song_id AND l1.user_id != l2.user_id
	GROUP BY l1.user_id, l2.user_id, l1.day
	HAVING sngcnt >= 3

),
F AS (
	SELECT user1_id, user2_id
	FROM FriendShip 

	UNION 

	SELECT user2_id, user1_id
	FROM FriendShip 
	
)

SELECT DISTINCT C.u1 AS user_id, C.u2 AS recommended_id
FROM C
WHERE (C.u1, C.u2) NOT IN (SELECT F.user1_id, F.user2_id FROM F);`
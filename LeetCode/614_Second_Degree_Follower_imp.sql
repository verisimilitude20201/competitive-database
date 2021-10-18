SELECT f2.followee AS follower, COUNT(DISTINCT f2.follower) AS num 
FROM follow F1 
JOIN follow F2 ON f1.follower = f2.followee
GROUP BY f2.followee
ORDER BY f2.followee 
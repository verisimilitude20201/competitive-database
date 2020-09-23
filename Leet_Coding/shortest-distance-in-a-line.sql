SELECT MIN(ABS(P1.x - P2.x)) AS shortest
FROM Point P1, Point P2
WHERE P1.x != P2.x

/*
1. Cross JOIN
2. Select the minimum ABS difference amongst x-coordinates of a point.

*/
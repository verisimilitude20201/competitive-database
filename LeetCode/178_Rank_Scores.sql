/* Method one - sub-query */

SELECT score, (SELECT COUNT(DISTINCT score) FROM Scores WHERE Scores.score >= S1.score) AS `Rank`
FROM Scores S1
GROUP BY score
ORDER BY score DESC

/* Method two - Self join  */
SELECT s.Score, count(distinct t.score) Rank
FROM Scores s JOIN Scores t ON s.Score <= t.score
GROUP BY s.Id
ORDER BY s.Score desc
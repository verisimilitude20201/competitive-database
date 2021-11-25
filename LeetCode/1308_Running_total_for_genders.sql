SELECT S1.gender, S2.day, SUM(S2.score_points)
FROM Scores S1
JOIN Scores S2 ON S1.gender = S2.gender
WHERE S1.day >= S2.day
GROUP BY S1.gender, S1.day
ORDER BY S1.gender, S1.day
;
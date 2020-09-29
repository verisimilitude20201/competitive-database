SELECT 
	gender, 
	day, 
	SUM(score_points) OVER (Partition By Gender ORDER BY day) AS total
FROM 
	Scores
ORDER BY gender, day
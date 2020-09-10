===>

select scr.Score, (select COUNT(distinct(scr2.Score)) from Scores scr2 where scr2.Score >= scr.Score) AS `Rank` 
FROM Scores  scr
ORDER BY `Rank`

/*We pick up one score. Inner query tries to find the count for all scores which are greater than or equal to this score. This becomes the rank of that score. For example: there are two rows with
score as 4.00. We take distinct and this makes the count to 1.*/
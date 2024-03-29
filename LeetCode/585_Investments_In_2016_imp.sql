SELECT SUM(a.TIV_2016) AS TIV_2016
FROM Insurance a
WHERE 
	1 = (SELECT COUNT(*) FROM Insurance b WHERE a.LAT = b.LAT and a.LON = b.LON)
	AND
	1 < (SELECT COUNT(*) FROM Insurance c WHERE a.TIV_2015 = c.TIV_2015)
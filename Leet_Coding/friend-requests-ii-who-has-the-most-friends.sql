SELECT id1 AS id, COUNT(id2) AS num 
FROM (
	SELECT requester_id AS id1, accepter_id AS id2
	FROM request_accepted

	UNION 

	SELECT accepter_id AS id1, requester_id AS id2
	FROM request_accepted
) t
GROUP BY id1
ORDER BY num DESC
LIMIT 1

/*
+--------------+-------------+------------+
| requester_id | accepter_id | accept_date|
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
+--------------+-------------+------------+

The crux of the solution is taking the UNION of requester_id and accepter_id per the given sub-query. It yields the below resultset. Note that UNION ALL is not required here.

id1 id2
1    2
1    3
2    3
3    4
2    1
3    1
3    2
4    1


*/
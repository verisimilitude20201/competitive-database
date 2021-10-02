# Write your MySQL query statement below

SELECT id2 AS id, COUNT(id1) AS num

FROM

(
SELECT requester_id AS id1, accepter_id AS id2
FROM request_accepted

UNION

SELECT accepter_id AS id1, requester_id AS id2
FROM request_accepted
) t
GROUP BY id2 
ORDER BY 2 DESC
LIMIT 1
SELECT ROUND(IF(fr.total_requests=0, 0.00, ra.accepted/fr.total_requests), 2) AS accept_rate 
FROM
(SELECT COUNT(DISTINCT CONCAT(requester_id, accepter_id))  AS accepted 
FROM request_accepted) ra, (SELECT COUNT(DISTINCT CONCAT(sender_id , send_to_id))  AS total_requests 
FROM friend_request) fr


/*

1. This counts the total number of distinct requests accepted by each requester_id, accepter_id

(SELECT COUNT(DISTINCT CONCAT(requester_id, accepter_id))  AS accepted 
FROM request_accepted) ra

2. This counts the total number of distinct requests sent.

(SELECT COUNT(DISTINCT CONCAT(sender_id , send_to_id))  AS total_requests 
FROM friend_request) fr

3. This just divides and ROUNDs the result to 2 decimals. If fr.total_requests are 0, the rate is set to 0.00 

SELECT ROUND(IF(fr.total_requests=0, 0.00, ra.accepted/fr.total_requests), 2) AS accept_rate 

*/
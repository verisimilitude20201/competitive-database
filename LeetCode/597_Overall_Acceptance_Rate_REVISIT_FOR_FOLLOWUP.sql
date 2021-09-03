
/*Overall Request Acceptance rate */
SELECT IF(TotalRequestCount.cnt1=0, 0.00, ROUND(RequestAcceptedCount.cnt / TotalRequestCount.cnt1, 2)) AS accept_rate
FROM (
    SELECT COUNT(DISTINCT requester_id, accepter_id) AS cnt
    FROM RequestAccepted
) AS RequestAcceptedCount, (
    SELECT COUNT(DISTINCT sender_id, send_to_id) AS cnt1
    FROM FriendRequest
) AS TotalRequestCount;
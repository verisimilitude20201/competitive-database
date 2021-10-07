SELECT Request_at AS Day,  ROUND(SUM(IF(Status="cancelled_by_driver" OR Status="cancelled_by_client", 1, 0)) / COUNT(Id), 2) AS `Cancellation Rate`
FROM Trips
WHERE 
    Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned='Yes')
    AND
    Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned='Yes')
    AND
    Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 1
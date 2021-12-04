SELECT U1.*
FROM UserActivity U1
LEFT JOIN UserActivity U2 ON U1.username = U2.username AND U1.endDate < U2.endDate
GROUP BY u1.username, u1.endDate
HAVING COUNT(u2.endDate) = 1

UNION

SELECT username, activity, startDate, endDate
FROM UserActivity
GROUP BY username
HAVING COUNT(activity) = 1
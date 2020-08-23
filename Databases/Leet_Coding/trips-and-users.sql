/* ===> * 

We need to find the cancellation rate. That is.

1. Find total number of requests made by unbanned users be it driver or client between Oct 1, 2013 and Oct 3, 2013. 
2. Find the number of cancellation requests made by unbanned users between Oct 1, 2013 and Oct 3, 2013


The query is as per below


SELECT request_at as Day, round(SUM(case when Status = "completed" then 0 else 1 end)/COUNT(*), 2) as "Cancellation Rate"
FROM trips
WHERE 
  client_id not in (SELECT users_id from users where banned="Yes") AND 
  driver_id not in (SELECT users_id from users where banned="Yes") AND 
  request_at BETWEEN "2013-10-01" AND "2013-10-03"
Group by request_at
ORDER BY request_at

Let's split it to understand.

1. round(SUM(case when Status = "completed" then 0 else 1 end)/COUNT(*), 2)

This computes a running sum of Statuses that are not "completed". This is divided with the count of records that satisfy condition 2.

2. WHERE 
    client_id not in (SELECT users_id from users where banned="Yes") AND 
    driver_id not in (SELECT users_id from users where banned="Yes") AND 
    request_at BETWEEN "2013-10-01" AND "2013-10-03"

Since we need Unbanned users, the WHERE clause contains two constructs to remove those client_id and driver_ids that are banned. The BETWEEN restricts the dates between 2013-10-01 and 2013-10-03

3. Group By/order by has been added for request_at






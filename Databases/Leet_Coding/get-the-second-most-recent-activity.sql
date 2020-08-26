SELECT *
FROM UserActivity
GROUP BY username
HAVING COUNT(*) = 1

UNION


SELECT * 
FROM UserActivity U1
WHERE 1 = 
(
    SELECT COUNT(DISTINCT U2.startDate)
    FROM UserActivity U2 
    WHERE U1.username = U2.username
    AND U2.startDate > U1.startDate
    
)



/*

UserActivity table:
+------------+--------------+-------------+-------------+
| username   | activity     | startDate   | endDate     |
+------------+--------------+-------------+-------------+
| Alice      | Travel       | 2020-02-12  | 2020-02-20  |
| Alice      | Dancing      | 2020-02-21  | 2020-02-23  |
| Alice      | Travel       | 2020-02-24  | 2020-02-28  |
| Bob        | Travel       | 2020-02-11  | 2020-02-18  |
+------------+--------------+-------------+-------------+

1. The first query of the UNION clause gives all records for which the count is 1. For example in this case it will print 

| Bob        | Travel       | 2020-02-11  | 2020-02-18  |


2. The second query of the UNION clause
    a. Contains a correlated sub-query which computes the count of records in the inner query for each record retrieved in the outer query. 
        i. Consider the outer query selects U1.startDate = 2020-02-12
        ii. For inner query: U2.startDate = 2020-02-12. 
            So U2.startDate > U1.startDate becomes false and count is 0.
        
        iii. Again U2.startDate = 2020-02-21 
              U2.startDate > U1.startDate becomes
              2020-02-21 > 2020-02-12 which gives count 1.

        iv. Again U2.startDate = 2020-02-24 
            U2.startDate > U1.startDate becomes
            2020-02-24 > 2020-02-12 which gives count 2.

        iv. Now, U1.startDate becomes 2020-02-21 
        
        v. For inner query: U2.startDate = 2020-02-12. 
           So U2.startDate > U1.startDate becomes false and count is 0.

        vi. For inner query: U2.startDate = 2020-02-21. 
            So U2.startDate > U1.startDate becomes false.
            2020-02-21 > 2020-02-21 which gives count 0.
        
        vii. For inner query: U2.startDate = 2020-02-24. 
            So U2.startDate > U1.startDate becomes false.
            2020-02-24 > 2020-02-21 which gives count 1.
    
    b. For aiii and avii conditions, the correlated sub-query gives the count as 1. Therefore, below record is selected containing the second most recent activity.

    | Alice      | Dancing      | 2020-02-21  | 2020-02-23  |
        




*/
/*
Table Accounts:

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
the id is the primary key for this table.
This table contains the account id and the user name of each account.
 

Table Logins:

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| login_date    | date    |
+---------------+---------+
There is no primary key for this table, it may contain duplicates.
This table contains the account id of the user who logged in and the login date. A user may log in multiple times in the day.

*/

/* ===> */

WITH t AS (
    SELECT DISTINCT id, login_date, DENSE_RANK() OVER (PARTITION BY id ORDER BY login_date) rank_date
FROM Logins
)

SELECT id, name 
FROM Accounts a
WHERE id IN (
    SELECT t1.id 
    FROM t t1, t t2
    WHERE t1.login_date = DATE_ADD(t2.login_date, INTERVAL 4 DAY) 
    AND t1.rank_date - t2.rank_date = 4
    AND t1.id = t2.id)
ORDER BY 1


/** Let's break this query one-by-one to understand **/

/* 1. Query in WITH */

SELECT DISTINCT id, login_date, DENSE_RANK() OVER (PARTITION BY id ORDER BY login_date) rank_date
FROM Logins

/*
This partitions the result-set by ids, orders each result within the partition by login_date in ascending order. 
It then computes the rank of each date within each partition using DENSE_RANK(). DENSE_RANK() computes an incremental rank over a partition for the defined column in order by clause
viz. DENSE_RANK() OVER (PARTITION BY id ORDER BY login_date)

id	login_date	rank_date
1	2020-05-30	1
1	2020-06-07	2
7	2020-05-30	1
7	2020-05-31	2
7	2020-06-01	3
7	2020-06-02	4
7	2020-06-03	5
7	2020-06-10	6
*/


/* 2. Sub-Query in Where clause */
SELECT t1.id 
FROM t t1, t t2
WHERE t1.login_date = DATE_ADD(t2.login_date, INTERVAL 4 DAY) 
AND t1.rank_date - t2.rank_date = 4
AND t1.id = t2.id

/* 
This will select 7 and 2020-05-30 because 
    a. Difference between its rank and the rank of 2020-06-03 is (5 - 1) = 4
    b. Difference between 2020-05-30 and 2020-06-03 is 4 days.
*/
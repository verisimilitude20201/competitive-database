/* ====> */

SELECT player_id, device_id
FROM activity WHERE (player_id, event_date) 

IN 

(SELECT player_id, MIN(event_date) AS event_date 
FROM activity
GROUP BY player_id)

/*** 
How it works

1. Here the inner query gives below output

SELECT player_id, MIN(event_date) AS event_date 
FROM activity
GROUP BY player_id

player_id       event_date
------------------------------
1               2016-03-01
2               2017-06-25
3               2016-03-02 

2. WHERE clause in the OUTER query selects those tuples from inner query by matching the combination of (player_id, event_date)


WHY DOUBLE GROUP BY (viz. GROUP BY player_id, device_id) will never work.
----------------------------------------------------------------------------
GROUP BY player_id, device_id means put all those which have identical values of player_id, device_id in one group. In our case, it will lead to below incorrect result.

+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+

If you closely observe, both last two rows have same player_id but different device_id.

***/
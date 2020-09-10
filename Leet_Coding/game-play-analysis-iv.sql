SELECT ROUND(COUNT(t2.player_id)/COUNT(t1.player_id),2) AS fraction
FROM
(SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id) t1 
LEFT JOIN Activity t2 ON t1.player_id = t2.player_id AND t1.first_login = t2.event_date - 1



/*

1. SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id

Keeps track of the date when each user logged in first.

2. (SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id) t1 
    LEFT JOIN Activity t2 ON t1.player_id = t2.player_id AND t1.first_login = t2.event_date - 1

Selects all player ids having consecutive day logins from the first login. So t1 contains all players, t2 contians those players who have logged in consecutively after first login.


3. SELECT ROUND(COUNT(t2.player_id)/COUNT(t1.player_id),2) AS fraction

Simple computing that calcuates the fraction.

*/
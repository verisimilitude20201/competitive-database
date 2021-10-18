SELECT A1.player_id, A1.event_date, SUM(A2.games_played) AS games_played_so_far 
FROM Activity A1, Activity A2
WHERE A1.event_date >= A2.event_date AND A1.player_id = A2.player_id
GROUP BY A1.player_id, A1.event_date
ORDER BY A1.player_id, A1.event_date


SELECT
player_id, event_date, sum(games_played) over(PARTITION BY player_id ORDER BY event_date)
AS 'games_played_so_far'
FROM activity
ORDER BY player_id, games_played_so_far;


SELECT a1.player_id, a1.event_date,
 (SELECT sum(a2.games_played) FROM activity a2
 WHERE a1.player_id = a2.player_id AND a1.event_date >=a2.event_date
 GROUP BY a1.player_id)
 AS games_played_so_far
 FROM activity a1 ORDER BY a1.player_id, games_played_so_far;
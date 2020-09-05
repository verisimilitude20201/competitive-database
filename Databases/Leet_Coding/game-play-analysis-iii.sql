select 
    player_id,
    event_date,
    SUM(games_played) over (partition by player_id order by event_date) as games_played_so_far
from activity

/*
The window function partitions the data by player_id and each partition is ordered by event_date. The SUM(games_played) is run as a running total on 'games_played' of every tuple 
in a partition.

*/
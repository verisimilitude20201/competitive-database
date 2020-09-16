With sum_scores AS (
    SELECT player_id, SUM(score) AS score
    FROM (
        SELECT first_player As player_id, first_score AS score 
        FROM Matches
        
            UNION ALL

        SELECT second_player As player_id, second_score AS score 
        FROM Matches
    ) scores
    GROUP BY player_id
    
), max_total_score_per_group AS (
    
    SELECT group_id, MAX(score) AS score
    FROM Players 
    INNER JOIN sum_scores ON Players.player_id = sum_scores.player_id
    GROUP BY group_id

)
SELECT group_id, MIN(Players.player_id) AS player_id 
FROM Players 
INNER JOIN sum_scores ON Players.player_id = sum_scores.player_id
WHERE (group_id, score) IN (
    SELECT group_id, score
    FROM max_total_score_per_group

)
GROUP BY group_id


/*
The problem statement is we need to find the group_id and player_id with the maximum total score in each group.

1. The first CTF sum_scores computes the SUM(scores) for all the players. It uses a UNION ALL query to take a non-distinct UNION of first player and second player scores. Union because
a player can either be a first player or a second player.

SELECT player_id, SUM(score) AS score
FROM (
    SELECT first_player As player_id, first_score AS score 
    FROM Matches
    
        UNION ALL

    SELECT second_player As player_id, second_score AS score 
    FROM Matches
) scores
GROUP BY player_id


2. The second CTF max_total_score_per_group contains a JOIN between players and sum_scores. It tries to find the maximum total score for each group.

SELECT group_id, MAX(score) AS score
FROM Players 
INNER JOIN sum_scores ON Players.player_id = sum_scores.player_id
GROUP BY group_id


3. Finally, we JOIN players again with sum_scores. We select only those groups whose score is equal to the maximum score in that group.  The final group by on player_id is essential 
because in case there is a tie between scores, we select the lowest player_id.

SELECT group_id, MIN(Players.player_id) AS player_id 
FROM Players 
INNER JOIN sum_scores ON Players.player_id = sum_scores.player_id
WHERE (group_id, score) IN (
    SELECT group_id, score
    FROM max_total_score_per_group

)
GROUP BY player_id


*/
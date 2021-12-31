# Write your MySQL query statement below
With Temp AS (
    SELECT host_team AS team,
        (
            CASE WHEN host_goals > guest_goals THEN 3
                 WHEN host_goals = guest_goals THEN 1
                 WHEN host_goals < guest_goals THEN 0
            END
            
        ) score
    
    FROM Matches
    
    UNION ALL
    
    SELECT guest_team AS team,
    (
        CASE WHEN guest_goals > host_goals THEN 3
             WHEN guest_goals = host_goals THEN 1
             WHEN guest_goals < host_goals THEN 0
        END
            
    ) score
    FROM matches

)
SELECT team_id, team_name, IF(score is NULL, 0, SUM(score)) as num_points
FROM Teams
LEFT JOIN Temp ON Teams.team_id = Temp.team
GROUP BY Teams.team_id
ORDER BY 3 DESC, 1 ASC
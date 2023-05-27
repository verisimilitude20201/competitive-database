SELECT T1.team_name AS home_team, T2.team_name AS away_team
FROM Teams T1, Teams T2
WHERE T1.team_name != T2.team_name
ORDER BY 1
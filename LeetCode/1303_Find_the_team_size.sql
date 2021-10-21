# Write your MySQL query statement below
With Team_Size AS (
    SELECT team_id, COUNT(team_id) AS team_size
    FROM Employee
    GROUP BY team_id
) 

SELECT E1.employee_id,  ts.team_size
FROM employee E1
INNER JOIN Team_Size ts ON E1.team_id = ts.team_id
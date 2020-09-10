WITH team_id_size AS (
    SELECT team_id, COUNT(team_id) AS team_size
    FROM Employee
    GROUP BY team_id
)
SELECT employee_id , team_size
FROM employee INNER JOIN team_id_size ON employee.team_id = team_id_size.team_id 
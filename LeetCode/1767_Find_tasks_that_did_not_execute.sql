/*

1. For each sub-task, find out the task_ids through a recursive CTE.
2. LEFT Join the above table in 1 with the Executed table and print those (task, sub-task combination) for which executed table does'nt have an entry.

*/

WITH RECURSIVE CTE AS (
    SELECT task_id, subtasks_count 
    FROM Tasks
    
    UNION ALL
    
    SELECT task_id, subtasks_count  - 1
    FROM CTE
    WHERE subtasks_count  > 1
)
SELECT task_id, subtasks_count  AS subtask_id
FROM CTE
WHERE (task_id, subtasks_count ) NOT IN (SELECT * FROM Executed)

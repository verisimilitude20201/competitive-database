SELECT t.from_id AS person1, t.to_id AS person2, COUNT(*) AS call_count, SUM(duration) AS total_duration FROM
(
    SELECT from_id, to_id, duration
    FROM Calls
    WHERE from_id < to_id
    
    UNION ALL

    SELECT to_id AS from_id, from_id AS to_id, duration
    FROM calls
    WHERE from_id > to_id
) t
GROUP BY t.from_id, t.to_id
ORDER BY t.from_id, t.to_id
SELECT
    DISTINCT sub_id AS post_id,
    (SELECT COUNT(DISTINCT sub_id) FROM Submissions S2 WHERE S1.sub_id = S2.parent_id) AS number_of_comments
FROM
    Submissions AS S1
WHERE parent_id IS NULL
ORDER BY sub_id
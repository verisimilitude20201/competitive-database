/* ===> */
With posts AS (
    SELECT DISTINCT(sub_id) AS sub_id FROM Submissions WHERE parent_id IS NULL
) 
SELECT posts.sub_id AS post_id, COUNT(DISTINCT Submissions.sub_id) AS number_of_comments
FROM posts 
LEFT JOIN Submissions ON posts.sub_id = Submissions.parent_id
GROUP BY posts.sub_id
ORDER BY posts.sub_id

/*
1. The With statement returns a temporary table containing only posts.  We explicitely have added WHERE parent_id IS NULL in that.
2. In the query, we apply LEFT JOIN on posts to fetch post_id as the first column and the distinct count of posts as the second column.
    a. Note that for post_id 12, there are 0 comments. This can be arrived because COUNT(NULL) is always 0.

*/
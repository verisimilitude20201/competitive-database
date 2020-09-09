SELECT DISTINCT viewer_id AS id
FROM Views
GROUP BY viewer_id, view_date
HAVING COUNT(DISTINCT article_id) > 1
ORDER BY id


/*

We need 2 GROUP BYs by viewer_id and view_date. The table can contain duplicate records for this as well.

*/
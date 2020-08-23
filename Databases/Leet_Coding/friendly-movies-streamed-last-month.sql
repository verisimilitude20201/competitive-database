/* =====> */

SELECT DISTINCT(title) AS title
FROM Content
INNER JOIN TVProgram ON Content.content_id = TVProgram.Content_id
WHERE LOWER(Kids_content) LIKE 'y' AND LOWER(content_type) LIKE 'movies' 
AND DATE(program_date) BETWEEN '2020-06-01' AND '2020-06-30'   
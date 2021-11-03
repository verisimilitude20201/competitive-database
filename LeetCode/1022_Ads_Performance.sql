# Write your MySQL query statement below
SELECT t.ad_id,
    ROUND(IF(
        t.click_count + t.view_count=0, 0, 
        (t.click_count / (t.click_count + t.view_count)) * 100
      
      ), 2) AS ctr
FROM (
    
    SELECT ad_id, SUM(IF(action='Clicked', 1, 0)) AS click_count, SUM(IF(action='Viewed', 1, 0)) AS view_count
    FROM Ads
    GROUP By ad_id
) t
ORDER BY 2 DESC, 1 ASC
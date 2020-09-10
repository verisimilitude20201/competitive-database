select ad_id, 
	round((case when (total_click + total_view) = 0 then 0 else total_click/(total_click + total_view)*100 end),2) as ctr 
from (
	select ad_id, sum(case when action= 'clicked' then 1 else 0 end) as total_click, sum(case when action= 'viewed' then 1 else 0 end) as total_view from Ads
	group by ad_id
) a
order by ctr desc, ad_id


/*

1. INNER query gives a SUM of all 1s and thereby gives the count. Separate CASE constructs give total clicks and total viewed. 
2. Outer query just computes the required percentage 
    Total clicks
----------------------------      * 100
  Total clicks + Total views


*/
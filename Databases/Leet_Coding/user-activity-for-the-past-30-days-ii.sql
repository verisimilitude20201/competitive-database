/* ===> */


select ifnull(round(sum(x)/count(user_id),2),0.00) as average_sessions_per_user 
from 
(
select user_id, count(distinct session_id) as x
from activity
where 
activity_date between date_sub('2019-07-27',interval 29 day) and '2019-07-27'
group by user_id
) as t 


/*
1. INNER query gives a distinct count of sessions between 2019-06-28 to 2019-07-27
2. Outer query computers the sum of session count and divides it by the total number of user records.
*/
select a.bin, ifnull(b.total,0) as total from
(select '[0-5>' as bin
UNION
select '[5-10>' as bin 
UNION
select '[10-15>' as bin
UNION
select '15 or more' as bin ) a left join 
(
select (case when duration/60 between 0 and 5 then '[0-5>'
      when duration/60 between 5 and 10 then '[5-10>'
      when duration/60 between 10 and 15 then '[10-15>'
      when duration/60 > 15 then '15 or more' end) as bin,
      count(session_id) as total
from sessions
group by 1) b on a.bin=b.bin


/*
1.   This query prints the session bins for those sessions which have a non-zero count of sessions lying within those bins. 

    select (case when duration/60 between 0 and 5 then '[0-5>'
        when duration/60 between 5 and 10 then '[5-10>'
        when duration/60 between 10 and 15 then '[10-15>'
        when duration/60 > 15 then '15 or more' end) as bin,
        count(session_id) as total
    from sessions
    group by 1


2.  For calculating those bins which have a zero session count we
    i. Do a UNION 4 times  for the 4 bins
      
      (select '[0-5>' as bin
        UNION
        select '[5-10>' as bin 
        UNION
        select '[10-15>' as bin
        UNION
        select '15 or more' as bin ) a
    
    ii. Compute a left join of table 'a' with the table in above query 1


3. Use IFNULL function to use a 0 in place of NULL for those bins that don't have sessions.
*/
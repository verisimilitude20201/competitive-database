/*Solution 1 */
With ctf1 AS (

	SELECT "[0-5>" AS bin, 0*60 AS min_duration, 5*60 AS max_duration
	UNION
	SELECT "[5-10>" AS bin, 5*60 AS min_duration, 10*60 AS max_duration
	UNION
	SELECT "[10-15>" AS bin, 10*60 AS min_duration, 15*60 AS max_duration
	UNION 
	SELECT "15 or more" AS bin, 15*60 AS min_duration, 2147483647  AS max_duration

)

SELECT ctf1.bin, COUNT(s.session_id) AS total
FROM Sessions s
RIGHT JOIN ctf1 
		ON s.duration >= min_duration 
        AND s.duration < max_duration				 
GROUP BY ctf1.bin;


/*Solution 2*/
select "[0-5>" as bin,sum(case when duration/60 between 0 and 5 then 1 else 0 end)Total from sessions
union
select "[5-10>" ,sum(case when duration/60 between 5 and 10 then 1 else 0 end) from sessions
union
select "[10-15>",sum(case when duration/60 between 10 and 15 then 1 else 0 end) from sessions
union
select "15 or more" ,sum(case when duration/60 >15 then 1 else 0 end) from sessions
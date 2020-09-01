
With call_duration_union AS (
    select caller_id, duration from calls
        union
    select callee_id, duration from calls

)

SELECT country.name As country
FROM call_duration_union 
INNER JOIN Person ON call_duration_union.caller_id = Person.id
INNER JOIN Country ON Country.country_code = SUBSTRING_INDEX(Person.phone_number, '-', 1)
GROUP BY country 
HAVING AVG(call_duration_union.duration) > (SELECT AVG(call_duration_union.duration) FROM call_duration_union)


/*

1. Union is computed of the caller and callee ids in a separate CTE. This is the crux of the solution. 
2. The remaining query is just an INNER JOIN between the CTE, Person and Country and application of GROUP BY with country. 
3. Having clause filters the group by's result by leaving out the single country whose 

Average call duration in a country > Global average call duration

*/
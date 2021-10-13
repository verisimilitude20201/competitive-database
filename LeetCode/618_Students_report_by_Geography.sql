SELECT 
	MAX(CASE WHEN continent='America' then name END) AS America,
    MAX(CASE WHEN continent='Asia' then name END) AS Asia,
    MAX(CASE WHEN continent='Europe' then name END) AS Europe
    
FROM (SELECT *, row_number() OVER (PARTITION BY continent ORDER BY NAME) AS row_id FROM student) t
group by row_id
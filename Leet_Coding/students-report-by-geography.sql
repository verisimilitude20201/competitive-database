SELECT
    MAX(IF(continent="America" AND name IS NOT NULL, name, NULL)) AS "America",
    MAX(IF(continent="Asia" AND name IS NOT NULL, name, NULL)) AS "Asia",
    MAX(IF(continent="Europe" AND name IS NOT NULL, name, NULL)) AS "Europe"
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name ASC) AS row_id FROM student
) t
GROUP By t.row_id
ORDER BY name

/*
1. INNER Query, assigns a unique row number for every student partitioned by the name of the continent. Applying this query will give the below relation

SELECT *, ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name ASC) AS row_id FROM student

| name   | continent |  row_id
|--------|-----------|
| Jack   | America   |    1
| Pascal | Europe    |    1
| Xi     | Asia      |    1
| Jane   | America   |    2


2. We then flip the solution so that name of the continent becomes the column

IF(continent="America" AND name IS NOT NULL, name, NULL)) AS "America",
IF(continent="Asia" AND name IS NOT NULL, name, NULL)) AS "Asia",
IF(continent="Europe" AND name IS NOT NULL, name, NULL)) AS "Europe"

This leads to the below resultset

row_id     America      Europe       Asia
1           Jack        NULL         NULL
2           Jane        NULL         NULL
1           NULL        Pascal       NULL
1           NULL        NULL         Asia


3. We need to eliminate the NULLs. Therefore, we apply MAX() on each column and we group by row_id. 

row_id     America      Europe       Asia
1           Jack        NULL         NULL

If we flip this over, we realize that there are 3 records with row_id 1. So if we group by row_id and apply MAX(), it will eliminate the records with NULL entries in them.  

*/
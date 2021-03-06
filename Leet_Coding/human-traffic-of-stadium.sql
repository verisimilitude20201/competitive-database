/* ==> */ 


SELECT id, visit_date, people
FROM (
SELECT *, COUNT(*) OVER(PARTITION BY grp) numEntries
FROM (
SELECT *, id - ROW_NUMBER() OVER (ORDER BY id) grp
FROM (
SELECT *
FROM stadium
WHERE people >= 100
) moreThan100
) grouped
) numPerSequence
WHERE numEntries > 2;

Need to understand this inside-out by adding the result-sets obtained.

1. Innermost query

SELECT *
FROM stadium
WHERE people >= 100

Gives below result-set
=====================================
visit_date	id	people
2017-01-01	2	109
2017-01-01	3	150
2017-01-01	5	145
2017-01-01	6	1,455
2017-01-01	7	199
2017-01-01	8	188
=====================================


2. 

SELECT *, id, ROW_NUMBER() OVER (ORDER BY id), id - ROW_NUMBER() OVER (ORDER BY id) grp
FROM (
SELECT *
FROM stadium
WHERE people >= 100
) moreThan100

==========================================================
id	visit_date	people	id	row_number	grp
2	2017-01-01	109	2	2	1            1
3	2017-01-01	150	3	3	2            1
5	2017-01-01	145	5	4	3            2
6	2017-01-01	1,455	6	4	         2
7	2017-01-01	199	7	7	5            2
8	2017-01-01	188	8	8	6            2 
============================================================

If you check the difference between id and row_number columns, it is given in the grp column at last. For the last 4 entries that are consecutive, its 2.


3. 

SELECT *, COUNT(*) OVER(PARTITION BY grp) numEntries
from (
SELECT *, id, ROW_NUMBER() OVER (ORDER BY id), id - ROW_NUMBER() OVER (ORDER BY id) grp
FROM (
SELECT *
FROM stadium
WHERE people >= 100
) moreThan100
) grouped

Here we apply the count(*) function on each of the sub-groupings defined by grp i.e. 1 and 2. It gives below output

===============================================================
id	visit_date	people	id	row_number	grp   numEntries  
2	2017-01-01	109	2	2	1            1      2
3	2017-01-01	150	3	3	2            1      2  
5	2017-01-01	145	5	4	3            2      4
6	2017-01-01	1,455	6	4	         2      4
7	2017-01-01	199	7	7	5            2      4
8	2017-01-01	188	8	8	6            2      4  
===============================================================

4. And finally

SELECT id, visit_date, people
FROM (
SELECT *, COUNT(*) OVER(PARTITION BY grp) numEntries
FROM (
SELECT *, id - ROW_NUMBER() OVER (ORDER BY id) grp
FROM (
SELECT *
FROM stadium
WHERE people >= 100
) moreThan100
) grouped
) numPerSequence
WHERE numEntries > 2;

This selects id, visit_date and people from resultset in step 3. numEntries is greater than 2 since we want all consecutive records with atleast 3 or more rows..

+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+


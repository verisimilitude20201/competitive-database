with firstcol as (
	SELECT first_col, ROW_NUMBER() OVER() AS row_num1
    FROM Data
    ORDER BY first_col 
) ,
secondcol AS (
	SELECT second_col, ROW_NUMBER() OVER() AS row_num2 
    FROM Data
    ORDER BY second_col DESC 
)
SELECT first_col, second_col
FROM firstcol
JOIN secondcol ON firstcol.row_num1 = secondcol.row_num2
SELECT MAX(group1.num) AS num 
FROM (
    SELECT num, COUNT(num) AS num_count
    FROM my_numbers
    GROUP BY num
) group1
WHERE num_count = 1



/*

1. INNER Sub-query returns the count of occurences of each number.

2.  

*/
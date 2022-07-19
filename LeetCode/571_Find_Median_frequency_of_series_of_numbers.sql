
/* 
https://www.youtube.com/watch?v=61xchKrKdl0

*/
With cumulative_sum AS (
    SELECT num, frequency, SUM(frequency) OVER (ORDER BY num) AS cumulative_freq, SUM(frequency) OVER() / 2 AS median_index
    FROM Numbers
) 
SELECT AVG(num) AS median
FROM cumulative_sum
WHERE median_index BETWEEN (cumulative_freq - frequency) AND cumulative_freq;
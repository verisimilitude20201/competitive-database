=>

SELECT
    (CASE
        WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
        WHEN MOD(id, 2) != 0 AND counts = id THEN id
        ELSE id - 1
    END) AS id,
    student
FROM
    seat,
    (SELECT
        COUNT(*) AS counts
    FROM
        seat) AS seat_counts
ORDER BY id ASC;

/*
The CASE construct
    i. Adds 1 to odd value of primary key if its not equal to the count of the rows.
    ii. if count is equal to the value of the value of the primary key, its the last odd row and must be skipped. Therefore it returns id itself.
    iii. For even numbers, it subtracts 1 from id and returns it.

On applying the CASE construct 

+---------+---------+
|    id   | student |
+---------+---------+
|    2    | Doris   |
|    1    | Abbot   |
|    4    | Green   |
|    3    | Emerson |
|    5    | Jeames  |
+---------+---------+


The ORDER by then does the remaining trick.

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+

*/
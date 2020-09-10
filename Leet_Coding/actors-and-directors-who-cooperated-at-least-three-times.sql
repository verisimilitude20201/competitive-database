/* ===> */

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(director_id) >= 3


/*
This is a typical case of application of 2-level GROUP BY on below relation

+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+

1. First GROUP BY on actor_id gives the following

Actor_id            COUNT(Director_id)             Remarks
1                      5                    3 entries with director_id 1
                                            2 entries with director_id 2
2                      2                    2 entries with director_id 1


2. Second level GROUP BY on director_id further bifurcates those director_id entries.

Actor_id            COUNT(Director_id)
1                      3
1                      2
2                      2

Applying a having clause on the above selects only the first row. Since we print the director_id too, in the SELECT clause, it gives a single tuple - 1, 1

*/
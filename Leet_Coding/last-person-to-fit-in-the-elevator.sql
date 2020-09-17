SELECT q1.person_name 
FROM queue q1 JOIN queue q2 ON q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1;


/*

1. The first part is generating a list of the below form to compute cumulative sum

FROM queue q1 JOIN queue q2 ON q1.turn >= q2.turn

q1.turn     q2.turn     q2.weight
----------------------------------
1	        1	        250
2	        1	        250
2	        2	        350
3	        1	        250
3	        2	        350
3	        3	        400
4	        1	        250
4	        2	        350
4	        3	        400
4	        4	        200
5	        1	        250
5	        2	        350
5	        3	        400
5	        4	        200
5	        5	        175
6	        1	        250
6	        2	        350
6	        3	        400
6	        4	        200
6	        5	        175
6	        6	        500

2. The next thing is computing the SUM() of weights and check if its <= 1000


*/
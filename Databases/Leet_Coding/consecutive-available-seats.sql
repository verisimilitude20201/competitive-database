/*
Several friends at a cinema ticket office would like to reserve consecutive available seats.
Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?
| seat_id | free |
|---------|------|
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |
 

Your query should return the following result for the sample case above.
 

| seat_id |
|---------|
| 3       |
| 4       |
| 5       |
Note:
The seat_id is an auto increment int, and free is bool ('1' means free, and '0' means occupied.).
Consecutive available seats are more than 2(inclusive) seats consecutively available

*/

SELECT DISTINCT(C1.seat_id) AS seat_id
FROM Cinema C1, Cinema C2
WHERE C1.seat_id != C2.seat_id AND ABS(C2.seat_id - C1.seat_id) = 1
AND C1.free=1 AND C2.free = 1
ORDER BY C1.seat_id

/*
The key of this solution is the two conditions
1. C1.seat_id != C2.seat_id: This condition helps not to select the same seat_nos from both copies of Cinema table.
2. ABS(C2.seat_id - C1.seat_id): This condition helps determine adjacent rows from both copies of Cinema table.
*/
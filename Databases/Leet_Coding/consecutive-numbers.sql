/* ==> */ 

a. 

SELECT consecutive.ConsecutiveNums
FROM (SELECT ROW_NUMBER() ORDER BY Id AS row, L1.num AS ConsecutiveNums
      FROM logs L1, logs L2, logs l3
      WHERE L1.id = L2.id - 1 and L2.id = L3.id - 1
      and L1.num = L2.num and l2.num = l3.num) AS consecutive

/* 
3 times the SELF-JOIN is taken here. And the first row L1's id is compared with L2's id which is further compared with L3's id. The second condition checks the equivalence of L1.num, L2.num and L3.num


b. Solution a works for where the id is sequential. If its not, we use Window function LAG to compare Num value with the one in its previous row.
*/
     
SELECT *
FROM Logs l1 
JOIN (SELECT Id, LAG(Num,1) OVER () AS lag_1 FROM Logs) l2 ON l1.Id = l2.Id
JOIN (SELECT Id, LAG(Num,2) OVER () AS lag_2 FROM Logs) l3 ON l1.Id = l3.Id
WHERE l1.Num = l2.lag_1 AND l1.Num = l3.lag_2

/* 
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |

First join compares Num from second row with the Num in first row. 
Second join compares Num from third row with the Num in first row. 

*/
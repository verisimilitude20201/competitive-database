SELECT DISTINCT L1.Num AS ConsecutiveNums
FROM Logs L1, Logs L2, Logs L3
WHERE L1.id =  L2.id - 1 AND L2.id = L3.id - 1 AND L1.Num = L2.Num AND L2.Num = L3.Num

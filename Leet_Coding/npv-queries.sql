SELECT queries.id, queries.year, IFNULL(NPV.npv,0) AS npv
FROM queries 
LEFT JOIN NPV ON queries.id = NPV.id AND queries.year = NPV.year
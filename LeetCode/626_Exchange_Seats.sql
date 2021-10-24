SELECT (
      
      CASE
            WHEN MOD(id, 2) != 0 AND id != S1.counts THEN id + 1
            WHEN MOD(id, 2) != 0 AND id = S1.counts THEN id
            ELSE id - 1
      END

) AS id, student
FROM Seat, (SELECT COUNT(id) AS counts FROM Seat) S1
ORDER BY id
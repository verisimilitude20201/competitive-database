SELECT Country.name AS country
FROM Person
JOIN Country ON SUBSTR(phone_number, 1, 3) = country_code
JOIN Calls on P.id IN (c.caller_id, c.callee_id)
GROUP BY Country.name
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls)
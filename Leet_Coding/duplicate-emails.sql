/* ==> */

SELECT Email
FROM Person
Group By Email
Having Count(Id) >= 2
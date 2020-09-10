/* ==> */

SELECT Person.FirstName, Person.LastName, Address.City, Address.State
FROM Person 
LEFT JOIN Address ON Person.PersonId = Address.PersonId

/* A Left Outer JOIN selects all records from the left table even if there are no corresponding matches in the right table. Values where there are no matches are set to NULL from the right table.
In this case for those "Persons'" who don't have "Addresses'" will have NULL for Address.City, Address.State */
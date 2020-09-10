/* ==> */
SELECT * FROM Patients
WHERE conditions LIKE '%DIAB1%';

/*
Note: 

1. LIKE 'DIAB1%' will match with 

| 3          | Bob          | DIAB100 MYOP |

since it starts with DIAB1, 


2. LIKE '%DIAB1' will not match with  

| 4          | George       | ACNE DIAB100 | 

This is because, it ends with 'DIAB100' and not '%DIAB1'

*/
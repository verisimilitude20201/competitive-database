/* ==> */

SELECT class 
FROM courses
group by class
having count(DISTINCT student) >= 5
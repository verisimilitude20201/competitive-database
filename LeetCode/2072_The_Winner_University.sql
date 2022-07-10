With excellent_new_york AS (
    SELECT COUNT(student_id) as ex1
    FROM NewYork
    WHERE score >= 90
    
),
excellent_california AS (
    SELECT COUNT(student_id) as ex2
    FROM California 
    WHERE score >= 90
)
SELECT 
    (
    CASE 
        WHEN ex1 > ex2 THEN "New York University"
        WHEN ex1 < ex2 THEN "California University"
        WHEN ex1 = ex2 THEN "No Winner"
    END
    ) Winner
FROM  excellent_new_york, excellent_california;

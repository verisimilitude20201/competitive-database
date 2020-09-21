With score_rnk AS (
    SELECT student_id, RANK() OVER (Partition BY exam_id ORDER BY score ASC) AS low_score_rank, 
    RANK() OVER (Partition By exam_id ORDER BY score DESC) AS high_score_rank
    FROM Exam
   
)
SELECT DISTINCT Student.student_id, student_name
FROM Student
JOIN Exam ON student.student_id = exam.student_id
WHERE Student.student_id NOT IN (SELECT student_id FROM score_rnk WHERE high_score_rank = 1 OR low_score_rank = 1)
ORDER BY Student.student_id

/*

1. The CTE assigns ranks to lowest and highest scores exam-wise. It gives rise to the below listing.

{"headers": ["student_id", "low_score_rank", "high_score_rank"], "values": [
[3, 3, 1], 
[2, 2, 2], 
[1, 1, 3], 
[1, 1, 1], 
[4, 3, 1], 
[3, 2, 2], 
[1, 1, 3], 
[4, 3, 1], 
[2, 2, 2], 
[1, 1, 3]]}

2. From this listing, for those students whose high_score_rank or low_score_rank is 1 are highest or lowest scores for a certain exam.

3. We have excluded these students from the final result who have highest and lowest scores for at least one exam.

*/
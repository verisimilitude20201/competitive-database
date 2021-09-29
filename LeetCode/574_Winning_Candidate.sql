SELECT Candidate.Name AS Name
FROM Vote
JOIN Candidate ON Candidate.id = Vote.CandidateId
GROUP BY Vote.CandidateId
ORDER BY COUNT(Vote.id) DESC
LIMIT 1
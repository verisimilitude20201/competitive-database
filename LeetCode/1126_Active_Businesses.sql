With avg_occurences AS (
    SELECT event_type, ROUND(AVG(occurences), 2) AS avg_1
    FROM Events
    GROUP BY event_type

)
SELECT business_id
FROM events
LEFT JOIN avg_occurences ON events.event_type = avg_occurences.event_type
WHERE events.occurences > avg_occurences.avg_1
GROUP BY business_id
HAVING COUNT(business_id) > 1;
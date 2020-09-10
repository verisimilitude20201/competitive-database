With average_occurence_events AS (
    SELECT event_type, AVG(occurences) AS occurences
    FROM Events
    GROUP BY event_type
)
SELECT business_id 
FROM events
INNER JOIN average_occurence_events ON Events.event_type = average_occurence_events.event_type
WHERE Events.occurences > average_occurence_events.occurences
GROUP BY business_id
HAVING COUNT(Events.event_type) > 1
ORDER BY business_id


/*

1. Firstly we compute the average occurences for each event type accross all businesses

SELECT event_type, AVG(occurences) AS occurences
FROM Events
GROUP BY event_type

2. Then we JOIN this CTF with events table to limit the resultset to those businesses
    a. Having more than one event types
    b. WHERE the number of occurences of the event type are greater than its average accross businesses.

*/
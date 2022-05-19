SELECT R1.driver_id, COUNT(DISTINCT R2.ride_id) AS cnt
FROM Rides R1
LEFT JOIN Rides R2 ON R1.driver_id = R2.passenger_id
GROUP BY R1.driver_id;
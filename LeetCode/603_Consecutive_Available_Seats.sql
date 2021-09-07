SELECT DISTINCT(C2.seat_id)
FROM Cinema C1, Cinema C2
WHERE abs(C2.seat_id - C1.seat_id) = 1 AND C1.free = 1 AND C2.free = 1
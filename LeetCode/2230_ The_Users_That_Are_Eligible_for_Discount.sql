CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
	# Write your MySQL query statement below.
	SELECT DISTINCT user_id
    FROM Purchases
    WHERE (time_stamp BETWEEN startDate AND endDate) AND amount >= minAmount
    ORDER BY user_id;
END;

With total_debit AS (
    SELECT paid_by,  SUM(amount) AS d_amount
    FROM Transactions
    GROUP BY paid_by

),

total_credit AS (
    SELECT paid_to,  SUM(amount) AS c_amount
    FROM Transactions
    GROUP BY paid_to

),

Balance_Sheet AS (
    SELECT Users.user_id, user_name, (credit - IFNULL(T1.d_amount, 0) + IFNULL(T2.c_amount, 0)) AS credit
    FROM Users
    LEFT JOIN total_debit T1 ON Users.user_id = T1.paid_by
    LEFT JOIN total_credit T2 ON Users.user_id = T2.paid_to
)

SELECT user_id, user_name, credit, IF(credit < 0, "Yes", "No")  AS credit_limit_breached
FROM Balance_Sheet;
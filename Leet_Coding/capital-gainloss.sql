SELECT stock_name, SUM(
    CASE operation
        WHEN "Buy" THEN (-1) * price
        ELSE price
    END
) capital_gain_loss 
FROM Stocks
GROUP BY stock_name
ORDER BY stock_name

/*

We compute a running sum of prices and group them by stock name. For a 'Buy', price is subtracted by multiplying it by (-1) else its added to the running sum.

*/
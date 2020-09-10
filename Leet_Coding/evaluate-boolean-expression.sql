SELECT V1.name AS left_operand,  operator, V2.name AS right_operand, 
(
    CASE operator
        WHEN '>' THEN IF(V1.value > V2.value, 'true', 'false')
        WHEN '<' THEN IF(V1.value < V2.value, 'true', 'false')
        WHEN '=' THEN IF(V1.value = V2.value, 'true', 'false')
    END
) value
FROM Expressions 
INNER JOIN Variables V1 ON Expressions.left_operand = V1.name
INNER JOIN Variables V2 ON Expressions.right_operand = V2.name

/*

1. To compute the left and right operands, we just take an INNER JOIN with 
    a. Expressions.left_operand = V1.name
    b. Expressions.right_operand = V2.name

2. Second key point is we use a CASE expression for the operator comparison.

3. We use IF expression to print a TRUE or FALSE..

*/
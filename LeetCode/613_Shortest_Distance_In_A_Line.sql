/*
    Crucial point here is we should not consider points where p1.x = p2.x in the self-join. Because same points distance will always be 0.
*/

SELECT MIN(ABS(p1.x - p2.x)) AS shortest FROM point p1 
JOIN point p2 WHERE p1.x != p2.x;
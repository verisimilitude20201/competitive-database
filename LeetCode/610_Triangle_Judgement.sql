/*
Three line segments can form a triangle if the sum of the lengths of any two sides is greater than the third side.
 
**/
SELECT x, y, z, IF(x + y > z AND x + z > y AND y + z > x, "Yes", "No") AS triangle
FROM triangle;
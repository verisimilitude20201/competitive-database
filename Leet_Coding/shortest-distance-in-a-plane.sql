select round(MIN(sqrt(pow(p1.x-p2.x,2)+pow(p1.y-p2.y,2))),2) shortest
FROM point_2d p1, point_2d p2
WHERE p1.x <> p2.x OR p1.y <> p2.y

/*

1. Cartesian product of p1, p2
2. Elimate same value combinations of x and y from both
3. Use distance formula for the remaining and apply MIN to find the least distance.

*/
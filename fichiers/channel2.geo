//+
Point(1) = {0, 1, 0, 1.0};
//+
Point(2) = {3, 0, -0, 1.0};
//+
Point(3) = {0, 0, 0, 1.0};
//+
Point(4) = {3, 1, -0, 1.0};
//+
Point(5) = {1, 1, 0, 1.0};
//+
Point(6) = {2, 1, -0, 1.0};
//+
Point(7) = {1.5, 2, -0, 1.0};
//+
Line(1) = {3, 1};
//+
Line(2) = {1, 5};
//+
Line(3) = {3, 2};
//+
Line(4) = {4, 2};
//+
Line(5) = {6, 4};
//+
Circle(6) = {5, 7, 6};
//+
Compound Curve {1, 3, 4, 5, 6, 2};
//+
Curve Loop(1) = {1, 2, 6, 5, 4, -3};
//+
Surface(1) = {1};
//+
Surface(1) = {1};
//+
Transfinite Curve {3, 4, 5, 6, 2, 1} = 10 Using Progression 1;
//+
Plane Surface(1) = {1};
//+
Transfinite Surface {1};
//+
Physical Curve("inlet", 7) = {1};
//+
Physical Curve("outlet", 8) = {4};
//+
Physical Curve("upper_wall", 9) = {2, 6, 5};
//+
Physical Curve("lower_wall", 10) = {3};
//+
Physical Curve("upper_wall", 9) += {2, 6, 5};
//+
Physical Curve("lower_wall", 10) += {3};

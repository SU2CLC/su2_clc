//+
Point(1) = {-0.7, 0.6, 0, 1.0};
//+
Point(2) = {0.3, 0.1, -0, 1.0};
//+
Point(3) = {-0.7, 0.1, 0, 1.0};
//+
Point(4) = {0.3, 0.6, -0, 1.0};
//+
Point(5) = {-0.4, 0.6, 0, 1.0};
//+
Point(6) = {-0, 0.6, -0, 1.0};
//+
Point(7) = {-0.2, 0.8, -0, 1.0};
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
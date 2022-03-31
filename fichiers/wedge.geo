// Gmsh project created on Wed Mar 30 16:19:11 2022
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {0, 1, 0, 1.0};
//+
Point(3) = {1.5, 1, 0, 1.0};
//+
Point(4) = {1.5, 0.167, 0, 1.0};
//+
Point(5) = {0.5, 0, 0, 1.0};
//+
Line(1) = {1, 5};
//+
Line(2) = {5, 4};
//+
Line(3) = {4, 3};
//+
Line(4) = {3, 2};
//+
Line(5) = {2, 1};
//+
Curve Loop(1) = {5, 1, 2, 3, 4};
//+
Plane Surface(1) = {1};
//+
Physical Curve("inlet", 6) = {5};
//+
Physical Curve("outlet", 7) = {3};
//+
Physical Curve("wall", 8) += {4, 1, 2};
//+
Physical Surface("flowfield", 8) = {1};
//+
Physical Curve("upper_wall", 9) = {4};
//+
Physical Curve("lower_wall", 10) = {1, 2};
//+
Transfinite Surface {1} = {2, 1, 4, 3};
//+
Recombine Surface {1};
//+
Transfinite Curve {5} = 201 Using Progression 1;
//+
Transfinite Curve {3} = 201 Using Progression 1;
//+
Transfinite Curve {4} = 151 Using Progression 1;
//+
Transfinite Curve {1} = 51 Using Progression 1;
//+
Transfinite Curve {2} = 101 Using Progression 1;

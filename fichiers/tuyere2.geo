// Gmsh project created on Wed Mar 30 16:38:59 2022
SetFactory("OpenCASCADE");
//+
SetFactory("OpenCASCADE");
//+
SetFactory("OpenCASCADE");
//+
SetFactory("Built-in");
//+
SetFactory("Built-in");
//+
lc = DefineNumber[ 0.1, Name "Parameters/lc" ];
//+
Point(1) = {0, 2.5, 0, 1.0};
//+
Point(2) = {0.1, 1.96, 0, 1.0};
//+
Point(3) = {0.2, 1.54, 0, 1.0};
//+
Point(4) = {0.3, 2.48, 0, 1.0};
//+
Point(5) = {0.3, 1.24, 0, 1.0};
//+
Recursive Delete {
  Point{4}; 
}
//+
Point(6) = {0.4, 1.06, 0, 1.0};
//+
Point(7) = {0.5, 1, 0, 1.0};
//+
Point(8) = {0.6, 1.02, 0, 1.0};
//+
Point(9) = {0.7, 1.08, 0, 1.0};
//+
Point(10) = {0.8, 1.18, 0, 1.0};
//+
Point(11) = {0.9, 1.32, 0, 1.0};
//+
Point(12) = {1, 1.5, 0, 1.0};
//+
Bezier(1) = {1, 2};
//+
Bezier(2) = {2, 3};
//+
Bezier(3) = {3, 5};
//+
Bezier(4) = {5, 6};
//+
Bezier(5) = {6, 7};
//+
Bezier(6) = {7, 8};
//+
Bezier(7) = {8, 9};
//+
Bezier(8) = {9, 10};
//+
Bezier(9) = {10, 11};
//+
Bezier(10) = {11, 12};
//+
Point(13) = {0, 0, 0, 1.0};
//+
Point(14) = {1, 0, 0, 1.0};
//+
Line(11) = {13, 14};
//+
Line(12) = {13, 1};
//+
Line(13) = {14, 12};
//+
Physical Curve("axis", 14) = {11};
//+
Physical Curve("inlet", 15) = {12};
//+
Physical Curve("outlet", 16) = {13};
//+
Physical Curve("wall", 17) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
//+
Curve Loop(1) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -13, -11, 12};
//+
Plane Surface(1) = {1};
//+
Physical Surface("flowfield", 18) = {1};
//+
Transfinite Curve {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} = 50 Using Progression 1;
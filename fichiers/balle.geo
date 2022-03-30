// Gmsh project created on Wed Jan 12 00:53:39 2022
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {-3.017, 0.5, 0, 1.0};
//+
Point(3) = {-3.017, -18.38, 0, 1.0};
//+
Circle(1) = {2, 3, 1};
//+
Circle(1) = {2, 1, 3};
//+
Circle(1) = {2, 3, 1};
//+
Circle(1) = {1, 2, 3};
//+
Recursive Delete {
  Point{3}; 
}
//+
Recursive Delete {
  Point{2}; 
}
//+
Point(2) = {3.017, 0.5, 0, 1.0};
//+
Recursive Delete {
  Point{1}; 
}
//+
Recursive Delete {
  Point{2}; 
}
//+
Circle(1) = {0, 0, 0, 18.88, 0, 2*Pi};
//+
Point(2) = {-3.1, 18.6, 0.1, 1.0};
//+
Point(3) = {0, 18.9, -0, 1.0};
//+
Point(4) = {0, 0, 0, 1.0};
//+
Recursive Delete {
  Curve{1}; 
}
//+
Circle(1) = {2, 4, 3};
//+
Circle(1) = {2, 3, 4};
//+
Circle(1) = {0, 0, 0, 18.88, 1.55, 2*Pi/3.6};
//+
Recursive Delete {
  Point{2}; 
}
//+
Recursive Delete {
  Point{3}; 
}
//+
Recursive Delete {
  Point{6}; 
}
//+
Recursive Delete {
  Curve{1}; 
}
//+
Point(5) = {0.3, 8.9, -0, 1.0};
//+
Point(6) = {0, 0, 0, 1.0};
//+
Point(7) = {3.017, 0.5, 0, 1.0};
//+
Point(8) = {4.5851919902459, -18.314759469143, 0, 1.0};
//+
Recursive Delete {
  Point{5}; 
}
//+
Circle(1) = {4, 8, 7};
//+
Point(9) = {5.017, 0.5, 0, 1.0};
//+
Line(2) = {7, 9};
//+
Point(10) = {6, 0.3793, 0, 1.0};
//+
Line(3) = {9, 10};
//+
Point(11) = {6, -0, 0, 1.0};
//+
Line(4) = {11, 10};
//+
Physical Curve(5) = {1, 2, 3, 4};
//+
Recursive Delete {
  Point{8}; 
}

//+
Point(15) = {4.5851919902459, 18.314759469143, 0, 1.0};
//+
Circle(5) = {4, 15, 12};
//+
Recursive Delete {
  Point{15}; 
}
//+
Line(6) = {12, 13};
//+
Line(7) = {13, 14};
//+
Line(8) = {14, 11};
//+
Curve Loop(1) = {1, 2, 3, -4, -8, -7, -6, -5};
//+
Plane Surface(1) = {1};
//+
Recursive Delete {
  Point{12}; 
}
//+
Recursive Delete {
  Point{13}; Point{12}; 
}
//+
Recursive Delete {
  Point{14}; 
}
//+
Point(15) = {-2, 0, 0, 1.0};
//+
Point(16) = {-2, 4, 0, 1.0};
//+
Point(17) = {9, 4, 0, 1.0};
//+
Point(18) = {9, 0, 0, 1.0};
//+
Line(9) = {4, 15};
//+
Line(10) = {15, 16};
//+
Line(11) = {16, 17};
//+
Line(12) = {17, 18};
//+
Line(13) = {18, 11};
//+
Curve Loop(2) = {11, 12, 13, 4, -3, -2, -1, 9, 10};
//+
Surface(2) = {2};
//+
Physical Curve("inlet", 14) = {10};
//+
Physical Curve("outlet", 15) = {12};
//+
Line(14) = {4, 11};
//+
Physical Curve("axis", 16) = {9, 14, 13};
//+
Physical Curve("bullet", 17) = {1, 2, 3, 4};
//+
Physical Curve("wall", 18) = {11};
//+
Transfinite Curve {10} = 30 Using Progression 1;
//+
Transfinite Curve {11} = 60 Using Progression 1;
//+
Transfinite Curve {12} = 30 Using Progression 1;
//+
Transfinite Curve {9} = 30 Using Progression 1;
//+
Transfinite Curve {13} = 50 Using Progression 1;
//+
Transfinite Curve {1, 2, 3, 4} = 500 Using Progression 1;
//+
Physical Curve(5) -= {1, 2, 3, 4};
//+
Physical Curve(" axis", 16) -= {9, 14, 13};
//+
Physical Curve("axis", 19) = {14, 9, 13};
//+
Physical Surface("flowfield", 20) = {2};

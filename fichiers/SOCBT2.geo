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
//+q
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
Point(12) = {-2, 0, 0, 1.0};
//+
Point(13) = {-2, 8.4, 0, 1.0};
//+
Point(14) = {14, 8.4, 0, 1.0};
//+
Point(15) = {14, 0, 0, 1.0};
//+
Point(16) = {0, 1, 0, 1.0};
//+
Point(17) = {0, 0.5, 0, 1.0};
//+
Point(18) = {3.017, 1, 0, 1.0};
//+
Point(19) = {5.017, 1, 0, 1.0};
//+
Point(20) = {6, 0.8793, 0, 1.0};
//+
Point(21) = {8, 0.8793, 0, 1.0};
//+
Point(22) = {8, 0.3793, 0, 1.0};
//+
Point(23) = {8, 0, 0, 1.0};
//+
Point(24) = {-1, 0, 0, 1.0};
//+
Point(25) = {-1, 0.5, 0, 1.0};
//+
Recursive Delete {
  Point{16}; 
}
//+
Line(5) = {4, 24};
//+
Line(6) = {24, 12};
//+
Line(7) = {12, 13};
//+
Line(8) = {13, 14};
//+
Line(9) = {14, 15};
//+
Line(10) = {15, 23};
//+
Line(11) = {23, 11};
//+
Line(12) = {10, 22};
//+
Line(13) = {23, 22};
//+
Line(14) = {22, 21};
//+
Line(15) = {21, 20};
//+
Line(16) = {10, 20};
//+
Line(17) = {24, 25};
//+
Line(18) = {25, 17};
//+
Line(19) = {4, 17};
//+
Line(20) = {17, 18};
//+
Line(21) = {18, 19};
//+
Line(22) = {19, 20};
//+
Physical Curve(5) -= {1, 2, 3, 4};
//+
Curve Loop(1) = {6, 7, 8, 9, 10, 13, 14, 15, -22, -21, -20, -18, -17};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {17, 18, -19, 5};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {1, 2, 3, 16, -22, -21, -20, -19};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {15, -16, 12, 14};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {4, 12, -13, 11};
//+
Plane Surface(5) = {5};
//+
Physical Surface("flowfield", 23) = {5, 4, 3, 2, 1};
//+
Physical Curve("inlet", 24) = {7};
//+
Physical Curve("outlet", 25) = {9};
//+
Physical Curve("wall", 26) = {8};
//+
Physical Curve("bullet", 27) = {1, 2, 3, 4};
//+
Transfinite Surface {2} = {25, 24, 4, 17};
//+
Transfinite Surface {4} = {10, 22, 21, 20};
//+
Transfinite Surface {5} = {10, 11, 23, 22};//+
//+
Line(23) = {18, 7};
//+
Line(24) = {19, 9};
//+
Transfinite Curve {17, 5, 19, 18} = 20 Using Progression 1;
//+
Transfinite Curve {19, 1, 23, 20} = 20 Using Progression 1;
//+
Transfinite Curve {21, 23, 2, 24} = 20 Using Progression 1;
//+
Transfinite Curve {22, 24, 3, 16} = 20 Using Progression 1;
//+
Transfinite Curve {15, 16, 12, 14} = 20 Using Progression 1;
//+
Transfinite Curve {12, 4, 11, 13} = 20 Using Progression 1;
//+
Transfinite Curve {6, 7, 8, 9, 10} = 20 Using Progression 1;
//+
Recombine Plane{4};//+
Transfinite Surface {4};
//+
Recombine Surface {4};
//+
Recombine Surface {4};
//+
Recombine Surface {5};
//+
Recombine Surface {3};
//+
Recombine Surface {2};
//+
Transfinite Surface {3} = {4, 10, 20, 17};
//+
Recombine Surface {3};

function [A,B,C] = ratreg(x,y)
% Perform Rational Regression.
sx = sum(x);
sy = sum(y);
sx2 = sum((x.^2));
sy2 = sum((y.^2));
sxy = sum((x.*y));
sxy2 = sum((x.*(y.^2)));
sx2y = sum(((x.^2).*y));
sx2y2 = sum((x.^2).*(y.^2));
n = length(x);
M = [sxy2 sy2  -sy  sxy;
     sx2y2 sxy2 -sxy sx2y;
     sxy  sy   -n   sx];
M = rref(M); 
B = M(1,4);
C = M(2,4);
A = M(3,4);
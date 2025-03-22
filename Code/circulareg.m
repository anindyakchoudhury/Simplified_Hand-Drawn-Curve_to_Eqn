function [g,f,c] = circulareg(x,y)
% Perform Circular Regression.
sx = sum(x);
sy = sum(y);
sx2 = sum((x.^2));
sy2 = sum((y.^2));
sx3 = sum((x.^3));
sy3 = sum((y.^3));
sxy = sum((x.*y));
sxy2 = sum((x.*(y.^2)));
sx2y = sum(((x.^2).*y));
n = length(x);
A = [2*sx2 2*sxy sx -(sx3+sxy2);
     2*sxy 2*sy2 sy -(sx2y+sy3);
     2*sx  2*sy  n  -(sx2+sy2)];
A = rref(A); 
g = A(1,4);
f = A(2,4);
c = A(3,4);
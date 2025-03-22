function eq=showans(r,ym,m,p)
% Display results.
X=sym('x');
Y=sym('y');
n = length(r);
digits(5);
r = sym(r,'d');
eq = 0;
if n == 2
    eq = sprintf("%.2f *X+(%.2f)",r(1),r(2));
elseif n == 3
    eq = sprintf("%.2f*X^2+(%.2f)*X+(%.2f)",r(1),r(2),r(3));
elseif n == 4
    eq = sprintf("%.2f*X^3+(%.2f)*X^2+(%.2f)*X+(%.2f)",r(1),r(2),r(3),r(4));
elseif n == 5
%     eq = sprintf("(X+r(3))/(r(4)*X+r(5))"); 
   eq= sprintf("(X+(%.2f))/((%.2f)*X+(%.2f))",r(3),r(4),r(5));
elseif n == 6
    eq =sprintf(" %.2f*exp((%.2f)*X)",r(5),r(6));
  
elseif n == 7
  
    eq=sprintf("X^2+Y^2+2*(%.2f)*X+2*(%.2f)*Y+(%.2f)",r(5),r(6),r(7));
end
% fprintf('%d<x<%d ==> ',m,p);
% disp(eq);
function [C,A] = expreg(x,y)
% Perform Exponential Regression.
y =log(y);
sumx=0;
sumy=0;
sumxy=0;
sumsqx=0;
n = length(x);
for i=1:n
    sumx=sumx+x(i);
    sumy=sumy+y(i);
    sumxy=sumxy+x(i)*y(i);
    sumsqx=sumsqx+x(i)^2;
end
A=(n*sumxy-sumx*sumy)/(n*sumsqx-(sumx)^2);
meanx=sumx/n;
meany=sumy/n;
C = meany-A*meanx;
C = exp(C);
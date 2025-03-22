function [r,ym,error_for_rms]= bestfitcurve(x,y)
% r is the vector of coefficients of the best fitted equation.
% ym is the vector of fitted ordinates.

% Linear fit, y = mx+c.
r1 = polyfit(x,y,1);
ym1 = polyval(r1,x);
r = r1;
ym = ym1;
e1 = sum(abs(y-ym1));
e = e1;
error_for_rms = abs(y-ym1);

% Second degree polynomial fit, y = ax^2+bx+c.
r2 = polyfit(x,y,2);
ym2 = polyval(r2,x);
e2 = sum(abs(y-ym2));
if e2<e1
    clear r;
    clear ym;
    clear error_for_rms;
    r = r2;
    ym = ym2;
    e = e2;
    error_for_rms = abs(y-ym2);
end

% Third degree polynomial fit, y = ax^3+bx^2+cx+d.
r2 = polyfit(x,y,3);
ym2 = polyval(r2,x);
e2 = sum(abs(y-ym2));
if e2<e
    clear r;
    clear ym;
    clear error_for_rms;
    r = r2;
    ym = ym2;
    e = e2;
    error_for_rms = abs(y-ym2);
end

% In rational, exponential, circular fit the coefficient
% vector includes some extra zeros so that from the length
% of the coefficient vector the real equation can be identified.

% Rational function fit, y = (x+A)/(Bx+C).
[A,B,C] = ratreg(x,y);
ym2 = (x+A)./(B.*x+C);
r2 = [0 0 A B C];  % show ans use case for n == 5
e2 = sum(abs(y-ym2));
if e2<e
    clear r;
    clear ym;
    clear error_for_rms;
    r = r2;
    ym = ym2;
    e = e2;
    error_for_rms = abs(y-ym2);
end

% Exponential fit. y = C*exp(Ax).
[C,A] = expreg(x,y);
ym2 = C.*exp(A.*x);
r2 = [0 0 0 0 C A]; % for the show ans n == 6
e2 = sum(abs(y-ym2));
if e2<e
    clear r;
    clear ym;
    clear error_for_rms;
    r = r2;
    ym = ym2;
    e = e2;
    error_for_rms = abs(y-ym2);
end

% Circular fit, x^2+y^2+2gx+2fy+c = 0.
[g,f,c] = circulareg(x,y);
ym21 = -f+abs(sqrt(g^2+f^2-c-(x+g).^2));
ym22 = -f-abs(sqrt(g^2+f^2-c-(x+g).^2));
r2 = [0 0 0 0 g f c];  %for showans n==7
e21 = sum(abs(y-ym21));
e22 = sum(abs(y-ym22));
if e22>e21
    e2 = e21;
else 
    e2 = e22;
end
if e2<e
    clear r;
    clear ym;
    clear error_for_rms;
    r = r2;
    ym = ym2;
    e = e2;
    error_for_rms = abs(y-ym2);
end

% Plot the curve for which sum of errors is minimum.
plot(x,ym,'r');
end

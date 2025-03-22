function showans2(r,ym,m,p)
% Display results.

n = length(r);
if n == 2
    fprintf('\n %d<x<%d ==> y = %dx ',m,p,r(1));
    if r(2)>=0
        fprintf('+');
    end
    fprintf('%d.\n',r(2));
elseif n == 3
    fprintf('\n %d<x<%d ==> y = %dx^2 ',m,p,r(1));
    if r(2)>=0
        fprintf('+');
    end
    fprintf('%dx ',r(2));
    if r(3)>=0
        fprintf('+');
    end
    fprintf('%d.\n',r(3));
elseif n == 4
    fprintf('\n %d<x<%d ==> y = %dx^3 ',m,p,r(1));
    if r(2)>=0
        fprintf('+');
    end
    fprintf('%dx^2 ',r(2));
    if r(3)>=0
        fprintf('+');
    end
    fprintf('%dx ',r(3));
    if r(4)>=0
        fprintf('+');
    end
    fprintf('%d.\n',r(4));
elseif n == 5
    fprintf('\n %d<x<%d ==> y = (x ',m,p);
    if r(3)>=0
        fprintf('+');
    end
    fprintf('%d)/(%dx ',r(3),r(4));
    if r(5)>=0
        fprintf('+');
    end
    fprintf('%d).\n',r(5));
elseif n == 6
    fprintf('\n %d<x<%d ==> y = %d*exp(%dx).\n',m,p,r(5),r(6));
elseif n == 7
    fprintf('\n %d<x<%d ==> x^2 + y^2 + 2*(%dx) + 2*(%dy)',m,p,r(5),r(6));
    if r(7)>=0
        fprintf('+');
    end
    fprintf('%d.\n',r(7));
end
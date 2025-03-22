function [x2,y2] = smoothsc(A)
% x2 is the 1*n vector of x-coordinates after smoothing.
% y2 is the 1*n vector of y-coordinates after smoothing.

[row,col] = size(A);
k = 1;
m=zeros( row*col,2);
% Find points from the image. 
% '0' corrsponds Black points.
for i = 1:row
    for j = 1:col
        if A(i,j) == 0
            m(k,1) = j; % x axis values on col 1
            m(k,2) = i; % y axis values on 2
            k = k+1;
        end
    end
end
 d=m(1:k-1, :);
% Ordinate of the lowest point has assumesd to be 1.
% '1' has added to avoid log(0) error. 
d(:,2) = max( d(:,2) )  +  1-  d(:,2); %taking the y axis value of black points

% Sort the points.
d = sortrows(d);
x = d(:,1);
y = d(:,2);

% Plot original points.
% scatter(x,y);
% hold on;
% plot(app.UIAxes3,y);
k = length(x);
p=1;
x1(p) = x(1);
y1(p) = y(1);

% Smooth vertical lines.
for i = 2:k-1
    if x(i) ~= x1(p)
        p=p+1;
    end
    x1(p) = x(i);
    y1(p) = y(i);
end
x1(p+1)= x(k);
y1(p+1)= y(k);
k = p+1;
p=1;
x2(p) = x1(1);
y2(p) = y1(1);

% Smooth horizontal lines.
for i = 2:k-1
    if y1(i) ~= y2(p)
        p=p+1;
    end
    x2(p) = x1(i);
    y2(p) = y1(i);
end
x2(p+1)= x1(k);
y2(p+1)= y1(k);

end

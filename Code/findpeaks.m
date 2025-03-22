function [peakx,peaky,px] = findpeaks(x2,y2)
% peakx is the vector of x_value of the peaks and crests.
% peaky is the vector of y_value of the peaks and crests.
% px is the vector of position of the peaks and crests.
k = length(x2);
j = 1;

% Set first image point to be a peak.
peakx(1) = x2(1);
peaky(1) = y2(1);
px(1) = 1;
for i = 1:k-2
    
    % Search peak.
    % A point is a peak if f(x)>f(x+h) && f(x)>f(x-h).
    if y2(i+1)>y2(i) && y2(i+1)>y2(i+2)
        j = j+1;
        peakx(j) = x2(i+1);
        peaky(j) = y2(i+1);
        px(j) = i+1;
    end
    
    % Search crest.
    % A point is a crest if f(x)<f(x+h) && f(x)<f(x-h).
    if y2(i+1)<y2(i) && y2(i+1)<y2(i+2)
        j = j+1;
        peakx(j) = x2(i+1);
        px(j) = i+1;
        peaky(j) = y2(i+1);
    end
end

% Set last image point to be a peak. 
peakx(j+1) = x2(k);
peaky(j+1) = y2(k);
px(j+1) = k;
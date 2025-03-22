% A code to segment a input curve and find easy 
% equation for each particular segment.
% Input curve should be a bitmap image with
% white background and curve should be drawn in black.
%(saved in 256 colour mode).

clc;
clear all;
format short;
close all;
warning off;
threshold_gap_per =2;
imageread_intesity = 80;
%Input Image.
A = imread('colorimagetry_1.jpg');

A = rgb2gray(A);
[r , c] = size (A);
threshold_gap =(r*threshold_gap_per*0.01);
A = A> 255*imageread_intesity*0.01;

% Smooth spikes, vertical and horizontal lines.
[x ,y] = smoothsc(A);

% plot the smoothened curve
plot(x,y, 'LineWidth', 1.5, 'color', 'k');
hold on;
% Find Peak and Crest points.
[peakx,peaky,px] = findpeaks(x,y);


% Number of equations is Number of peaks minus 1.
q = length(px);
% % % % disp('Fitted Equations Are:');
s = 1;
i = 1;
% plot(peakx(i),peaky(i),'ko','LineWidth',2.0);
% %for i = 1:q-1
while i <= q-1
    if ((px(i+s)-px(i)) > threshold_gap) || (i+s == q)
    m = px(i);
    n = px(i+s); 
    % Segment the curve for fittng.
    [r,ym,error_for_rms] = bestfitcurve(x(m:n),y(m:n));
    if i==1 
        error_col = error_for_rms;
    end
    if i>1
        error_col = [error_col error_for_rms];
    end
    % Display results.
    showans(r,ym,peakx(i),peakx(i+s)); %fitted graph display
	i = i+s;
    plot(peakx(i),peaky(i),'ko','LineWidth',2.0); %peak crest display
    s = 1; %setting the s again to the base to compare the current peak with the immediate next one
    else 
        s = s+1;
        continue
    end
end
rmserrorfinal = rms(error_col) %rms error display
legend('Original Curve','Peaks and Crests','Fitted Curve');
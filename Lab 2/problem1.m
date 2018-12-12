% He Feng
% EE 440 HW 2 Problem 1
close all;
clear all;
 
I = imread('2_1.bmp'); 
% Use one of the band to plot the histogram.
I_band = I(:,:,1);  
  
% Determine the size of this band of image.
% Let a variable starts at all zeros.
[m,n] = size(I_band); 
value = zeros(1,256);

% Using for loop to find the number of pixels on each gray level.
for k=0:255 
     numberOfPixel = find(I_band == k);
     value(k+1)=length(numberOfPixel); 
end 

% numel function returns the number of elements in I_band 
PDF = value/numel(I_band);
% Find the cumulative sum from the first element of PDF.
CDF = cumsum(PDF);

figure;
% Plot one band of the image.
subplot(3, 1, 1);
imshow(I_band);
title('One band of the imageè') ;

% Plot the histogram within a bar format by using bar function.
% Make the histogram to the color of black because it looks cooler.
subplot(3, 1, 2);
bar(0:255,value,'k');  
title('Histogram of the image') 

% Plot the CDF which has been described above.
subplot(3, 1, 3);
plot(CDF,'k');
title('CDF of pixel value of 2_1.bmp')

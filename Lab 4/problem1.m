% He Feng
% EE 440 HW 4 Problem 1
close all;
clear all;

% Load the bmp image and convert it from RGB to gray style.
im = imread('4_1.bmp');
im = rgb2gray(im);
subplot(2,2,1);
imshow(im)
title('Original image');

% Adding noise to the original image.
[a,b]=size(im);
% Using randperm function to select 15 percent random pixel which will be
% altered.
p = randperm(a*b,round(a*b*0.15));
% Divide the altered pixels group into two. Half of them will set to black,
% and the other half will set to white.
len = length(p)/2;
p1 = p(1:len);
p2 = p(len+1:end);
im(p1) = 0;
im(p2) = 255;
subplot(2,2,2);
imshow(im)
title('add noise image');

% Convert the image type from uint8 to double.
im_n = im2double(im);

% Reducing the noise y using low pass filter.
u = -a/2:(a/2-1);
v = -b/2:(b/2-1);
[U,V] = meshgrid(u,v);
D = sqrt(U.^2+V.^2);
D0 = 70;
H = double(D <= D0); 
[m, n] = size(H);
J = fftshift(fft2(im_n, m, n));  
K = J.*H;  
L_filter_n=ifft2(ifftshift(K));  
subplot(2,2,3);
imshow(L_filter_n)
title('lowpassfilter image');

% Reducing the noise y using median filter.
x1 = im_n;
x2 = x1;
for i = 1:a-2
    for j = 1:b-2
          list = x1(i:(i+2), j:(j+2)); 
          list = list(:); 
          med = median(list);
          x2(i+1, j+1) = med;
    end
    
end
medianImage = x2;
subplot(2,2,4);
imshow(medianImage)
title('medianfilter image');

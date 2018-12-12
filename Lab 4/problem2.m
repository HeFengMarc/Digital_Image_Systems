% He Feng
% EE 440 HW 4  problem 2
close all;
clear all;

% Load the original image and then display it in one subplot.
% Convert the image to HSV from RGB such that we can process it's V image
% into the high boost filter.
I = imread('4_2.bmp');
H = rgb2hsv(I);
subplot(1,2,1);
imshow(I);
title('Original image');

V = H(:,:,3);
[new_V,D] = Highboostfilters(V,100,400);
H(:,:,3) = new_V/255;
I1 = hsv2rgb(H);
subplot(1,2,2);
imshow(I1);
title('High boost image');
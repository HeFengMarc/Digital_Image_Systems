% He Feng
% EE 440 HW 2 Problem 3
close all;
clear all;

% Read the original image.
image = imread('2_1.bmp','bmp');
% Plot the original image.
subplot(1,2,1);
imshow(image)
title('The Original Image');

% Get the negative of each R G B images.
% Plot the negative image.
negative(:,:,1)=255-image(:,:,1);
negative(:,:,2)=255-image(:,:,2);
negative(:,:,3)=255-image(:,:,3);
subplot(1,2,2);
imshow(negative)
title('the Negative Image');

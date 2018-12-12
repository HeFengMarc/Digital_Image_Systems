% He Feng
% EE 440 HW 2 Problem 2
close all;
clear all;

% Read the image.è
image = imread('2_2.bmp','bmp');

% Find the R G B images.
image_r=image(:,:,1);
image_g=image(:,:,2);
image_b=image(:,:,3);

% Plot the original image and three components image in one figure.
figure(1)
subplot(2,2,1);
imshow(image)
title('Original Image'); 
subplot(2,2,2);
imshow(image_r)
title('Red Image');  
subplot(2,2,3);
imshow(image_g)
title('Green Image');  
subplot(2,2,4);
imshow(image_b)
title('blue Image');  
 
% Convert the image to HSV
figure(2)
hsva = rgb2hsv(image);
image_h = hsva(:,:,1);
image_s = hsva(:,:,2);
image_v = hsva(:,:,3);
subplot(2,2,1);
imshow(hsva)
title('HSV Image');
subplot(2,2,2);
imshow(image_h)
title('H Image');
subplot(2,2,3);
imshow(image_s)
title('S Image');
subplot(2,2,4);
imshow(image_v)
title('V Image');


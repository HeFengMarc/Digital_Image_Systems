clear all;
close all;

% Transfer the screenshot picture into bmp format such that we can use it
% to compare with the given non-perfect image.
pic = imread('3_1.bmp','bmp');
picture = imread('3_11.png');
imwrite(picture,'3_11.bmp','bmp');

% Get eh RGB images of the original image and problem image.
picture_r = picture(:,:,1);
picture_g = picture(:,:,2);
picture_b = picture(:,:,3);

pic_r = pic(:,:,1);
pic_g = pic(:,:,2);
pic_b = pic(:,:,3);

figure(1)
% Red image of the problem picture.
subplot(3,2,1);
imshow(pic_r);
title('red image - problem');
% Red image of the original picture.
subplot(3,2,2);
imshow(picture_r);
title('red image - original');
% Green image of the problem picture.
subplot(3,2,3);
imshow(pic_g);
title('green image - problem');
% Green image of the original picture.
subplot(3,2,4);
imshow(picture_g);
title('green image - original');
% Blue image of the problem picture.
subplot(3,2,5);
imshow(pic_b);
title('blue image - problem');
% Blue image of the original picture.
subplot(3,2,6);
imshow(picture_b);
title('blue image - original');

% Get the histogram of the RGB images of original image and problem image.
figure(2)
subplot(3,2,1);
imhist(pic_r);
title('red image - problem');
subplot(3,2,2);
imhist(picture_r);
title('red image - original');
subplot(3,2,3);
imhist(pic_g);
title('green image - problem');
subplot(3,2,4);
imhist(picture_g);
title('green image - original');
subplot(3,2,5);
imhist(pic_b);
title('blue image - problem');
subplot(3,2,6);
imhist(picture_b);
title('blue image - original');

% Histogram equilization of green image by using my own function.
pic(:,:,2) = myhisteq(pic(:,:,2));

figure
subplot(1,2,1);
imshow(picture);
title('original image');
subplot(1,2,2);
imshow(pic);
title('fixed problem image');



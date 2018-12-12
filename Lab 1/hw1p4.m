% He Feng
% EE 440 HW 1 Problem 4
close all;
clear all;

% Draw the original picture.
figure(1)
X = load('1_3.asc');
imshow(X/256);

% Keep one pixel out of every 4x4 pixel area, and display image Y1.
figure(2)
Y1 = X(1:4:384,1:4:256);
imshow(Y1/256);
Y1_uint8 = uint8(Y1);
imwrite(Y1_uint8,'Y1.jpg');

% Replace every pixel area and replace with its average number by using two
% additional functions.
figure(3)
Y2 = averagethenscaleimage(X,4);
imshow(Y2);
imwrite(Y2,'Y2.jpg');

% Using pixel repeating to enlarge the image
figure(4)
Y1_new_1 = pixelrepeating(Y1,4);
imshow(Y1_new_1/256);
Y1_new_1_uint8 = uint8(Y1_new_1);
imwrite(Y1_new_1_uint8,'Y1_new_1.jpg');

% Using bilinear interpolation to enlarge the image.
figure(5)
Y1_new_2 = bilinearInter('Y1.jpg',4,4);
imshow(Y1_new_2);
Y1_new_2_uint8 = uint8(Y1_new_1);
imwrite(Y1_new_2_uint8,'Y1_new_2.jpg');



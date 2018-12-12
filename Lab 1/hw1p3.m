% He Feng
% EE 440 HW 1 Problem 3
close all;
clear all;

% Read the photo and its associate colormap.
[X,map] = imread('1_2.tif','tif');

% Show the original photo X.
figure(1)
imshow(X,map);

% Transfer the photo X into gray scale.
Y = ind2gray(X,map);
figure(2)
imshow(Y);

% To make sure the type of image.
% Y is a 256 level gray scale image.
class(Y)

% Rotate image Y.
Z = imrotate(Y,-45);
figure(3)
imshow(Z);

% Store the image Y and Z into the folder.
imwrite(Y,'Y_image.jpg');
imwrite(Z,'Z_image.jpg');

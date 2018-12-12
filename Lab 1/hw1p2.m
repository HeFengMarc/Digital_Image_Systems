% He Feng
% EE 440 HW 1 Problem 2
close all;
clear all;

% Load and show the photo 1_4.bmp.
image = imread('1_4.bmp');
figure(1)
imshow(image);

% Get the type of the image data. 
% Get the maximum and minimum data values for the image.
class(image)
max_number = max(image(:))
min_number = min(image(:))

% Convert the data to the double type
% We can not show the double-typed image by imshow 
figure(2)
doubled_image = double(image);
imshow(doubled_image);

% To display a double image by using imshow, we need to transfer the image
% into the uint8 format.
figure(3)
imshow(uint8(doubled_image));

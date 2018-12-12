close all;
clear all;

im1 = imread('3_2.jpg');
im2 = imread('3_3.jpg');
hsvIm1 = rgb2hsv(im1);
hsvIm2 = rgb2hsv(im2);
V1 = hsvIm1(:,:,3);
V1 = uint8(V1*255);
V2 = hsvIm2(:,:,3);
V2 = uint8(V2*255);


%% The original images.
figure(1)
subplot(1,2,1);
imshow(im1);
title('3_2.jpg');
subplot(1,2,2);
imshow(im2);
title('3_3.jpg');

%% The images after line stretching.
outV1_1= LineStretching(V1);
outV1_2= LineStretching(V2);
figure
subplot(1,2,1);
hsvIm1(:,:,3)=double(outV1_1)/255;
outIm1=hsv2rgb(hsvIm1);
imshow(outIm1)
title('3_2.jpg after line stretching');
imwrite(outIm1, '3_2_line_stretch.jpg');
subplot(1,2,2);
hsvIm2(:,:,3)=double(outV1_2)/255;
outIm2=hsv2rgb(hsvIm2);
imshow(outIm2)
title('3_3.jpg after line stretching');
imwrite(outIm2, '3_3_line_stretch.jpg');

%% The images after doing histogram equilization.

outV2_1 = myhisteq(V1);
outV2_2 = myhisteq(V2);
figure
hsvIm1(:,:,3)=double(outV2_1)/255;
outIm=hsv2rgb(hsvIm1);
subplot(1,2,1);
imshow(outIm);
title('3_2.jpg after histogram equalization');
imwrite(outIm, '3_2_his_equal.jpg');
hsvIm2(:,:,3)=double(outV2_2)/255;
outIm=hsv2rgb(hsvIm2);
subplot(1,2,2);
imshow(outIm);
title('3_3.jpg after histogram equalization');
imwrite(outIm, '3_3_his_equal.jpg');

% Histogram after two images doing the histogram equalization.
figure
subplot(1,2,1);
imhist(outV2_1);
count1 = imhist(outV2_1);
title('Histogram after doing HE to 3_2.jpg');
subplot(1,2,2);
imhist(outV2_2);
count2 = imhist(outV2_2);
title('Histogram after doing HE to 3_3.jpg');

[m1_1,n1_1] = size(outV2_1);
[m1_2,n1_2] = size(outV2_2);
pdf1_1 = count1/(m1_1*n1_1);
cdf1_1 = cumsum(pdf1_1);
pdf1_2=count2/(m1_2*n1_2);
cdf1_2=cumsum(pdf1_2);
figure
subplot(2,2,1);
plot(1:256,pdf1_1);
title('pdf of 3_2.jpg after histogram equilization');
subplot(2,2,2);
plot(1:256,cdf1_1);
title('cdf of 3_2.jpg after histogram equilization');
subplot(2,2,3);
plot(1:256,pdf1_2);
title('pdf of 3_3.jpg after histogram equilization');
subplot(2,2,4);
plot(1:256,cdf1_2);
title('cdf of 3_3.jpg after histogram equilization');

%% The images after doing histogram specification
x =0:255;
pdf = normpdf(x,125,50);
figure
plot(x,pdf)
title('normally distributed sequence - pdf');

outV3_1 = HistSpec(V1,pdf);
hsvIm1(:,:,3)=double(outV3_1)/255;
outIm3_1 = hsv2rgb(hsvIm1);
outV3_2 = HistSpec(V2,pdf);
hsvIm2(:,:,3) = double(outV3_2)/255;
outIm3_2 = hsv2rgb(hsvIm2);
figure
subplot(1,2,1);
imshow(outIm3_1);
title('3_2.jpg after histogram specification');
imwrite(outIm3_1, '3_2_his_spec.jpg');
subplot(1,2,2);
imshow(outIm3_2);
title('3_3.jpg after histogram specification');
imwrite(outIm3_2, '3_3_his_spec.jpg');





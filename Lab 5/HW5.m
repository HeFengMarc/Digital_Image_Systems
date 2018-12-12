% He Feng
% EE 440 HW 5

clear all;
close all;

im = imread('5_1.bmp');
figure(1);
subplot(1,3,1)
imshow(im)
title('Original image');
im = double(im);

%% Apply FFT
f = fftshift(fft2(im));
 
magnitudeF = log(abs(f));
magnitudeF = mat2gray(magnitudeF);
angleF = angle(f);

subplot(1,3,2)
imshow(magnitudeF);
title('Noisy image FFT magnitude');
subplot(1,3,3)
imshow(angleF);
title('Noisy image FFT angle');

%% Fixing the noise.
% Using the Data Cursor to get the coordinate of each noise point in Noisy
% Image FFT Magnitude graph.
xy(:,1) = [128 130 384 386 128 130 384 386];
xy(:,2) = [128 130 128 130 384 386 384 386];

% Locate each point of noise and make the pixels arround them also to black
% such that the noise will be removed.
k=size(xy);
for i=1:k
    f(xy(i,1)-3:xy(i,1)+3,xy(i,2)-3:xy(i,2)+3) = 0;
end

%% Print out the fixed images.
im1 =real(ifft2(ifftshift(f)));
im1 = im2uint8(mat2gray(im1));
figure(2);
subplot(1,3,1)
imshow(im1);
title('Filter image');

f1 = fftshift(fft2(im1));

magnitudeF1 = log(abs(f1));
magnitudeF1 = mat2gray(magnitudeF1);
angleF1 = angle(f1);
subplot(1,3,2)
imshow(magnitudeF1);
title('Filter image FFT magnitude');
subplot(1,3,3)
imshow(angleF1);
title('Filter image FFT angle');

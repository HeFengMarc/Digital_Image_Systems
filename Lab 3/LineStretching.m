function outIm = LineStretching(im)

% The minimum pixel and maximum pixel of the image.
minPix = min(im(:));
maxPix = max(im(:));
k = 255/(maxPix-minPix);
b = 0;
outIm = k*(im-minPix)+b;

figure
subplot(2,2,1);
imshow(im);
subplot(2,2,2);
imhist(im);
subplot(223);
imshow(outIm);
subplot(224);
imhist(outIm);
title('line stretching')
end
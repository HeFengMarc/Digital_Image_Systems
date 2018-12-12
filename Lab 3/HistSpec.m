function outIm= HistSpec(im,pdf)

outIm=im;
[m,n]=size(im);
count=imhist(im);
cdf=cumsum(count/(m*n));
outCdf=cumsum(pdf);

figure
subplot(1,2,1);plot(1:256,cdf);
title('original cdf ');
subplot(1,2,2);plot(1:256,outCdf);
title('outcome cdf ');

newBin=zeros(1,256);
% To find the index where the difference between cdf and outCdf is the
% smallest.
for i=1:256
    [minDiff,index]=min(abs(cdf(i)-outCdf));
    newBin(i)=index;
end

for i=1:m
    for j=1:n
        outIm(i,j)=newBin(outIm(i,j)+1);
    end
end

figure
subplot(2,2,1);
imshow(im);
subplot(2,2,2);
imhist(im);
subplot(2,2,3);
imshow(outIm);
subplot(2,2,4);
imhist(outIm);
end


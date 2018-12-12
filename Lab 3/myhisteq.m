function outIm= myhisteq(im)

outIm=im;
[m,n]=size(im);
count=imhist(im);

pdf=count/(m*n);
cdf=cumsum(pdf);

for i=1:256
    % find index vector of bin i
    index=find(im==i-1);
    newBin=round(cdf(i)*256-1);
    for j=1:length(index)
        % Update the data to the output image
        outIm(index(j))=newBin;
    end
end

new_count=imhist(outIm);
outCDF=cumsum(new_count/(m*n));
  
figure
subplot(1,3,1);
plot(1:256,pdf);
title('pdf');

subplot(1,3,2);
plot(1:256,cdf);
title('original cdf ')
  
subplot(1,3,3);
plot(1:256,outCDF);
title('output cdf ');

figure
subplot(2,2,1);
imshow(im);
subplot(2,2,2);
imhist(im);
subplot(2,2,3);
imshow(outIm);
subplot(2,2,4);
imhist(outIm);
title('histogram equalization');
end

% He Feng
% EE 440 Final Project
% Oil Painting Effect.
function im = OilPainting(img)

% Determine the size of each dimension for the image.
[sizex,sizey,sizez] = size(img);
% Change the original image to type double.
imgd = im2double(img);
% Initially define the image by making a matrix which has the same size as
% the original image but full of ones.
im = ones(sizex,sizey,sizez);

radius = 3;
intensityLevel = 10;
% Chaning the image pixel by pixel
% Do not exceed the range based on the target area.
for i = (radius + 1):(sizex - radius) 
    for j = (radius + 1):(sizey - radius)
        % Determine the target area for each loop.
        targetArea = imgd(i-radius:i+radius,j-radius:j+radius,:);     
        intensityArea = (targetArea(:,:,1) + targetArea(:,:,2) + targetArea(:,:,3))/3*intensityLevel;     
        tempArea = uint8(intensityArea);
        maxAppearIntensity = mode(mode(tempArea));    
        maxCount = 0;
        maxrgb = [0,0,0];
        
        % To determine each pixel in the single target range one by one.
        for i1 = 1:5
            for j1 = 1:5
                % If any pixel in the given range has the intensity meet
                % the masx appear intensity, add up the specific target and
                % generate it to determine the average later.
                if tempArea(i1,j1) == maxAppearIntensity
                    maxCount = maxCount + 1;
                    maxrgb(1) = maxrgb(1) + targetArea(i1,j1,1);
                    maxrgb(2) = maxrgb(2) + targetArea(i1,j1,2);
                    maxrgb(3) = maxrgb(3) + targetArea(i1,j1,3);
                end
            end
        end
        im(i,j,:) = maxrgb * 255 / maxCount;
    end
end
% Change the image type back to uint8 type.
im = uint8(im);
end

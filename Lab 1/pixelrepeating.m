% He Feng
% EE 440 HW 1

% By using this function, we will enlarge the image by repeat the pixels in
% pixel area.
function output = pixelrepeating(image, scalefactor)

[a,b] = size(image);
% Initially set the output all zeros, which will be changed later.
output = zeros(scalefactor*a, scalefactor*b);

for x = 1:a
    for y = 1:b
        i = scalefactor*(x-1)+1;
        j = scalefactor*(y-1)+1;
        
        % Repeat each pixel to enlarge the image.
        for m = 1:scalefactor-1
            for n = 1:scalefactor-1
            output(i,j) = image(x,y);
            output(i+m,j) = image(x,y);
            output(i,j+n) = image(x,y);
            output(i+m,j+n) = image(x,y);
            end
        end
    end
end
end

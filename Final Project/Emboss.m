% He Feng
% EE 440 Final Project
% Emboss Effect
function K = Emboss(f0)

% Determine the input image size.
image_size = size(f0);
dimension = numel(image_size);

% If it is a color image, change it to a RGB image.
if dimension == 3
    f0 = rgb2gray(f0);
end

% Add multiplicative noise with variance 0.01.
f1 = imnoise (f0,'speckle',0.01); 
% Transfer the image above to type double.
f1 = im2double(f1); 
% Create a predefined 2-D filter.
h = fspecial('sobel'); 
% Apply the impulse response above to the last version image.
image = filter2(h,f1,'same'); 
% Convert the matrix to grayscale.
K = mat2gray(image); 
end

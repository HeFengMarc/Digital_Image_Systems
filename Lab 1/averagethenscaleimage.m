% He Feng

% We make the convolution first, and then used the new determined image as
% the input of the basic scaling function to get the final result.

function thumbnail = averagethenscaleimage(image, scalefactor)

% Make a matrix full of one.
one = ones(scalefactor, scalefactor);

% Make a kernal.
h = (1/(scalefactor*scalefactor)).*one;
double_image = double(image);
% Do the convolution
image_cov2 = conv2(double_image, h);
new_image = uint8(image_cov2);

% Scale the image after averaging.
thumbnail = scaleimage(new_image, scalefactor);

end
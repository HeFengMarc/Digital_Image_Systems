% He Feng

% This is the basic scaling function. We need to consider different cases
% as the scale factor can be an odd number or an even number.
function thumbnail = scaleimage(image, scalefactor)

% This is the remainder after divide scalefactor by 2.
remainder = mod(scalefactor, 2);

% Different cases when the remainder is 0 and 1.
if remainder == 0
    thumbnail=image((scalefactor/2: scalefactor: end-scalefactor), (scalefactor/2: scalefactor: end - scalefactor));
else
    thumbnail=image((((scalefactor+1)/2): scalefactor: end-scalefactor), (((scalefactor+1)/2): scalefactor: end - 1)); 
end
    

end
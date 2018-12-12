% He Feng
% This function have the same role as interp2() function.
function IM = bilinearInter(im,varargin)

    image = imread(im);
    scale(1)=varargin{1};
    scale(2)=varargin{2};
       
    % recognize the size of the picture
    [row,column,layer]=size(image);% check the size

    % the size of the new picture
    Row = round(row*scale(1));
    Column = round(column*scale(2));

    % Create a new picture starts with full of ones.
    IM = uint8(ones(Row,Column,layer));

    % calculate the pixels of the new picture
    for i = 1:Row
        for j = 1:Column
        
            % The corresponding point in the original picture.
            x=i/scale(1);
            y=j/scale(2);
        
            % Check whether the corresponding point will overflow
            if x < 1
                x = x+1;
            elseif x > row
                x = x-1;
            end
        
            if y < 1
                y = y+1;
            elseif y > column
                y = y-1;
            end
            
            % Round the number into the next smaller integer.
            a = floor(x);
            b = floor(y);
            
            % Round the corresponding point of the original picture toward
            % zero.
            % If the corresponding point is an integer
            if x == fix(x) && y == fix(y)
                IM(i,j,:)=image(x,y,:);
            
            % Represents two points (x,b), (x,b+1)
            elseif x == fix(x) && y ~= fix(y) 
                IM(i,j,:) = image(x,b+1,:).*(y-b) + image(x,b,:).*(b+1-y);
            
            % Represents two points (a,y), (a+1,y)
            elseif x~=fix(x) && y == fix(y) 
                IM(i,j,:) = image(a+1,y,:).*(x-a)+image(a,y,:).*(a+1-x);
            
            % Otherwise, solve the vertical part fitst and then solve the
            % horizontal part.
            else
                R1=image(a+1,b,:).*(x-a)+image(a,b,:).*(a+1-x);
                R2=image(a+1,b+1,:).*(x-a)+image(a,b+1,:).*(a+1-x);
                IM(i,j,:)=R2.*(y-b)+R1.*(b+1-y);
            end
        
        end
    end
end


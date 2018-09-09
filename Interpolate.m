function [InterpolatedImage] = Interpolate(image, flag)

if strcmp(flag,'columns')
    Width = 2*size(image, 2);
    Height = size(image, 1);
    InterpolatedImage = zeros(Height, Width);
    InterpolatedImage(:, 1:2:end) = image;
    for i=1:Height
        for j=2:2:Width-1
            InterpolatedImage(i,j)=uint8(round((InterpolatedImage(i,j-1)+InterpolatedImage(i,j+1))/2));
        end
    end
    InterpolatedImage(:,end)=uint8(InterpolatedImage(:,end-1));
else
    if strcmp(flag, 'rows')
        Width = size(image, 2);
        Height = 2*size(image, 1);
        InterpolatedImage = zeros(Height, Width);
        InterpolatedImage(1:2:end, :) = image;
        for i=1:Width
            for j=2:2:Height-1
            InterpolatedImage(j,i)=uint8(round((InterpolatedImage(j-1,i)+InterpolatedImage(j+1,i))/2));
            end
        end
        InterpolatedImage(end,:)=uint8(InterpolatedImage(end-1,:));
    else 
        error('Flag inválida, impossível interpolar');    
    end
end

InterpolatedImage = uint8(InterpolatedImage);

end
function InterpolatedImage = ZoomIn16(filename)

image = imread(filename);

InterpolatedImage = image;

for i=1:4
    InterpolatedImage = Interpolate(InterpolatedImage, 'rows');
end

for i=1:4
    InterpolatedImage = Interpolate(InterpolatedImage, 'columns');
end

outputFilename = strrep(filename,'.', '_interpolated.');
imwrite(InterpolatedImage, outputFilename);

end
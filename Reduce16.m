function Reduce16(filename)

image = imread(filename);

DecimatedImage = image;
for i=1:4
    DecimatedImage = Decimate(DecimatedImage, 2);
end

outputFilename = strrep(filename,'.', '_decimated.');
imwrite(DecimatedImage, outputFilename);

end
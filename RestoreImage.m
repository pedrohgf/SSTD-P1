function RestoredImage = RestoringImage(filename)
    
    Reduce16(filename);
    DecimatedImageFilename = strrep(filename,'.', '_decimated.');
    InterpolatedImage = ZoomIn16(DecimatedImageFilename);
    outputFilename = strrep(filename,'.', '_restored.');
    imwrite(InterpolatedImage, outputFilename);
end

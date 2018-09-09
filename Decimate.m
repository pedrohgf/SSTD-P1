function DecimatedImage = decimate(image, DecimationWidthFactor, OptionalDecimationHeightFactor)
    
if nargin == 3
  DecimationHeightFactor  = OptionalDecimationHeightFactor
else
    DecimationHeightFactor = DecimationWidthFactor;
end

DecimatedImage = uint8(image(1:DecimationWidthFactor:end, 1:DecimationHeightFactor:end));
end
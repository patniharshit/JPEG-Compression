function [ dctTransformed ] = myDCT( im, F )
%myDCT outputs DCT transformed image

dctTransformed = F*double(im)*transpose(F);

end


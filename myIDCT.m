function [ invdctTransformed ] = myIDCT( im, F )
%myIDCT outputs IDCT of transformed image

invdctTransformed = transpose(F)*double(im)*F;

end
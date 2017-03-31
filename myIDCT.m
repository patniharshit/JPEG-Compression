function [ invdctTransformed ] = myIDCT( im, F )
%myIDCT outputs IDCT of transformed image

invdctTransformed = F'*double(im)*F;

end
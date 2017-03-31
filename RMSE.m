function [ error ] = RMSE( im1, im2 )
%RMSE calculates root mean square error between two images

error = sqrt(sum((im1 - im2).^2)/length(im1));

end


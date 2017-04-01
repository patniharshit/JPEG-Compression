function [ error ] = RMSE( im1, im2 )
% RMSE calculates root mean square error between two images
temp = ((double(im1)-double(im2)).^2)/length(im1);
error = 0;

for i = 1:512
    for j = 1:512
        error = error + temp(i,j);
    end
end
error = error/numel(im1);
error = sqrt(double(error));

end


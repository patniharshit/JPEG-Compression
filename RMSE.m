function [ error ] = RMSE( im1, im2 )
% RMSE calculates root mean square error between two images
temp = ((double(im1)-double(im2)).^2)/(length(im1)*length(im1));
error = 0;
[x,y] = size(im1);

for i = 1:x
    for j = 1:y
        error = error + temp(i,j);
    end
end

error = sqrt(double(error));

end


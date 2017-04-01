function [ entropy ] = My_entropy( im )
%My_entropy calculates entropy of given image

[M, N] = size(im);
p = imhist(im) / (M*N);
p = p(p ~= 0);

entropy = 0;
for i = 1:size(p)
    entropy = entropy - (p(i) * log2(p(i)));
end

end


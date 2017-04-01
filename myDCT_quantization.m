function [ imqDCT ] = myDCT_quantization( imDCT, qm, c )
%myDCT_quantization for outputs quantized DCT image

imqDCT = ones(8,8);
for j = 1:8
    for i = 1:8
        imqDCT(i,j) = round(imDCT(i,j) ./ (qm(i,j) .* c));
    end
end

end


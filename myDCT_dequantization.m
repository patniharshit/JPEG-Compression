function [ dequantizedImage ] = myDCT_dequantization(imqDCT, qm, c)
%myDCT_dequantization de-quantizes the quantized DCT image

dequantizedImage = ones(8,8);
for j = 1:8
    for i = 1:8
        dequantizedImage(i,j) = round(imqDCT(i,j) .* (qm(i,j) .* c));
    end
end

end


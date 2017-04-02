% q5
% Plot entropy versus RMSE by varying the value of c

% Quantization matrix for luminance
Q=[16  11  10  16  24  40  51  61;
    12  12  14  19  26  58  60  55;
    14  13  16  24  40  57  69  56;
    14  17  22  29  51  87  80  62;
    18  22  37  56  68  109 103 77;
    24  35  55  64  81  104 113 92;
    49  64  78  87  103 121 120 101;
    72  92  95  98  112 100 103 99];

F = create_mat_dct();

im = imread('LAKE.TIF');
[im_x, im_y] = size(im);

rmse = zeros(1,105);
entropy = zeros(1,105);

for c = 1 : 255
    q_im = zeros(im_x, im_y);

    for j = 1 : 8 : im_x
       for i = 1 : 8 : im_y
           temp_im = im(i:i+7, j:j+7);
           dct_im = myDCT(temp_im, F);
           quant_im = myDCT_quantization(dct_im, Q, c);
           q_im(i:i+7, j:j+7) = quant_im;
       end
    end

    % Dequantize
    dq_im = zeros(im_x, im_y);

    for j = 1 : 8 : im_x
       for i = 1 : 8 : im_y
           temp_im = q_im(i:i+7, j:j+7);
           dequant_im = myDCT_dequantization(temp_im, Q, c);
           idct_im = myIDCT(dequant_im, F);
           dq_im(i:i+7, j:j+7) = idct_im;
       end
    end
    
    entropy(c) = My_entropy(uint8(dq_im));
    rmse(c) = RMSE(im, dq_im);
end

plot(rmse, entropy);
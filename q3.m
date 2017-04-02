% q2
% Apply DCT transform and quanitzation to LAKE.tif

% Classical quantization matrix for luminance matrix
Q=[16  11  10  16  24  40  51  61;
    12  12  14  19  26  58  60  55;
    14  13  16  24  40  57  69  56;
    14  17  22  29  51  87  80  62;
    18  22  37  56  68  109 103 77;
    24  35  55  64  81  104 113 92;
    49  64  78  87  103 121 120 101;
    72  92  95  98  112 100 103 99];

% 8-point 2d-DCT 
F = create_mat_dct();

im = imread('LAKE.TIF');

[im_x, im_y] = size(im);
out_im = zeros(im_x, im_y);
c = 2;

for i = 1 : 8 : im_x
   for j = 1 : 8 : im_y
       temp_im = im(i:i+7, j:j+7);
       dct_im = myDCT(temp_im, F);
       quant_im = myDCT_quantization(dct_im, Q, c);
       out_im(i:i+7, j:j+7) = quant_im;
   end
end

imshow((uint8(out_im)));
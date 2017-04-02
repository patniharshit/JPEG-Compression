% q2
% Take some patches out of image and apply DCT, Quantization,
% Dequantization, IDCT on them

%Quantization matrix for luminance
Q=[16  11  10  16  24  40  51  61;
    12  12  14  19  26  58  60  55;
    14  13  16  24  40  57  69  56;
    14  17  22  29  51  87  80  62;
    18  22  37  56  68  109 103 77;
    24  35  55  64  81  104 113 92;
    49  64  78  87  103 121 120 101;
    72  92  95  98  112 100 103 99];

c = 2;

%8-point 2d-DCT 
F = create_mat_dct();

im = imread('LAKE.TIF');
[imx, imy] = size(im);

clip1 = im(45:52, 420:427);
dc1 = myDCT(clip1, F);
quant1 = myDCT_quantization(dc1, Q, c);
dequant1 = myDCT_dequantization(quant1, Q, c);
idc1 = myIDCT(dequant1, F);
figure;
subplot(1,5,1); imshow(uint8(clip1)); title('Image');
subplot(1,5,2); imshow(uint8(dc1)); title('DCT');
subplot(1,5,3); imshow(uint8(quant1)); title('Qunatize');
subplot(1,5,4); imshow(uint8(dequant1)); title('Dequantize');
subplot(1,5,5); imshow(uint8(idc1)); title('IDCT');
im(45:52, 420:427) = idc1;

clip2 = im(298:305, 427:434);
dc2 = myDCT(clip2, F);
quant2 = myDCT_quantization(dc2, Q, c);
dequant2 = myDCT_dequantization(quant2, Q, c);
idc2 = myIDCT(dequant2, F);
figure;
subplot(1,5,1); imshow(uint8(clip2)); title('Image');
subplot(1,5,2); imshow(uint8(dc2)); title('DCT');
subplot(1,5,3); imshow(uint8(quant2)); title('Qunatize');
subplot(1,5,4); imshow(uint8(dequant2)); title('Dequantize');
subplot(1,5,5); imshow(uint8(idc2)); title('IDCT');
im(298:305, 427:434) = idc2;

clip3 = im(230:237, 30:37);
dc3 = myDCT(clip3, F);
quant3 = myDCT_quantization(dc3, Q, c);
dequant3 = myDCT_dequantization(quant3, Q, c);
idc3 = myIDCT(dequant3, F);
figure;
subplot(1,5,1); imshow(uint8(clip3)); title('Image');
subplot(1,5,2); imshow(uint8(dc3)); title('DCT');
subplot(1,5,3); imshow(uint8(quant3)); title('Qunatize');
subplot(1,5,4); imshow(uint8(dequant3)); title('Dequantize');
subplot(1,5,5); imshow(uint8(idc3)); title('IDCT');
im(230:237, 30:37) = idc3;

figure; imshow(uint8(im));
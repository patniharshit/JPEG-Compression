% q7
% Experiment to prove the perceptual redundancies in the YCbCR channel

im = imread('peppers.png');

YCBCR = rgb2ycbcr(im);
temp = YCBCR;

noiseType = 'gaussian';

% Add noise in Y channel
Y = imnoise(YCBCR(:,:,1), noiseType);
CB = YCBCR(:,:,2);
CR = YCBCR(:,:,3);

figure;
subplot(1,4,1); imshow(Y); title('Noised Y');
subplot(1,4,2); imshow(CB); title('CB');
subplot(1,4,3); imshow(CR); title('CR');

temp(:,:,1) = Y;
temp(:,:,2) = CB;
temp(:,:,3) = CR;
subplot(1,4,4); imshow(uint8(ycbcr2rgb(temp))); title('Resultant YCBCR');

% Add noise in CB channel
Y = YCBCR(:,:,1);
CB = imnoise(YCBCR(:,:,2), noiseType);
CR = YCBCR(:,:,3);

figure;
subplot(1,4,1); imshow(Y); title('Y');
subplot(1,4,2); imshow(CB); title('Noised CB');
subplot(1,4,3); imshow(CR); title('CR');

temp(:,:,1) = Y;
temp(:,:,2) = CB;
temp(:,:,3) = CR;
subplot(1,4,4); imshow(uint8(ycbcr2rgb(temp))); title('Resultant YCBCR');

% Add noise in CR channel
Y = YCBCR(:,:,1);
CB = YCBCR(:,:,2);
CR = imnoise(YCBCR(:,:,3), noiseType);

figure;
subplot(1,4,1); imshow(Y); title('Y');
subplot(1,4,2); imshow(CB); title('CB');
subplot(1,4,3); imshow(CR); title('Noised CR');

temp(:,:,1) = Y;
temp(:,:,2) = CB;
temp(:,:,3) = CR;
subplot(1,4,4); imshow(uint8(ycbcr2rgb(temp))); title('Resultant YCBCR');
% q6
% An experiment to test the hypothesis that using DCT gives better com-
% pression than using DFT

pics = {'autumn.tif',
    'board.tif',
    'cameraman.tif',
    'peppers.png',
    'coins.png',         
    'fabric.png',
    'liftingbody.png',
    'pears.png',
    'saturn.png',
    'tape.png',
    'office_4.jpg'
};
    
for idx = 1: size(pics)
    im = imread(pics{idx});
    var = size(size(im));
    if(var(2) == 3)
        im = rgb2gray(im);
    end
    
    im = imresize(im, [256 256]);
    
    figure; 
    subplot(1,3,1); imshow(im);
    
    % Apply DCT
    temp = im;

    for j = 1 : 8 : 256
       for i = 1 : 8 : 256
           temp_im = im(i:i+7, j:j+7);
           dct_im = idct2(temp_im);
           
           for i=1:8
            for j=1:8
                if((i+j)>6)
                    dct_im(i,j)=0;
                end
              end
            end
   
           quant_im = idct(dct_im);
           temp(i:i+7, j:j+7) = quant_im;
       end
    end
    
    subplot(1,3,2); imshow(temp); title('DCT');
    fprintf('RMSE of DCT of image: %i = %f\n', idx, RMSE(im, temp));
    
    % Apply DFT
    temp = im;

    for j = 1 : 8 : 256
       for i = 1 : 8 : 256
           temp_im = im(i:i+7, j:j+7);
           dct_im = fft2(temp_im);
           
           for i=1:8
            for j=1:8
                if((i+j)>6)
                    dct_im(i,j)=0;
                end
              end
            end
   
           quant_im = ifft(dct_im);
           temp(i:i+7, j:j+7) = quant_im;
       end
    end
    
    subplot(1,3,3); imshow(uint8(real(temp))); title('DFT');
    fprintf('RMSE of DFT of image: %i = %f\n\n', idx, RMSE(im, temp));
end
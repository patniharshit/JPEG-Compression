% q6
% An experiment to test the hypothesis that using DCT gives better com-
% pression than using DFT

pics = {'autumn.tif',
    'board.tif',};
%     'cameraman.tif',
%     'peppers.png',
%     'coins.png',         
%     'fabric.png',
%     'liftingbody.png',
%     'pears.png',
%     'saturn.png',
%     'tape.png',
%     'office_4.jpg'
% };

len = 512;

for idx = 1: size(pics)
    im = imread(pics{idx});
    var = size(size(im));
    if(var(2) == 3)
        im = rgb2gray(im);
    end
   
    im = imresize(im, [len len]);
   
    figure; 
    subplot(1,3,1); imshow(im); title('Original');
    
    % Apply DCT

    for j = 1 : 8 : len
       for i = 1 : 8 : len
           temp_im = im(i:i+7, j:j+7);
           dct_im = dct2(temp_im);
           
           for i1=1:8
            for j1=1:8
                if((i1+j1)>3)
                    dct_im(i1,j1)=0;
                end
            end
           end
           
           quant_im = idct2(dct_im);
           
           temp(i:i+7, j:j+7) = quant_im;
       end

    end
    
    subplot(1,3,2); imshow(uint8(temp)); title('DCT');
    fprintf('RMSE of DCT of image: %i = %f\n', idx, RMSE(im, temp));
    a = temp;
    
     % Apply DFT

     for j = 1 : 8 : len
        for i = 1 : 8 : len
            temp_im = im(i:i+7, j:j+7);

            dct_im = fft2(temp_im);
           
            for i2=1:8
             for j2=1:8
                 if((i2+j2)>3)
                     dct_im(i2,j2)=0;
                 end
             end
            end
            
            quant_im = ifft2(dct_im);
            
            temp(i:i+7, j:j+7) = quant_im;
            
        end
     end

     subplot(1,3,3); imshow(uint8(real(temp))); title('DFT');
     fprintf('RMSE of DFT of image: %i = %f\n\n', idx, RMSE(im, temp));
end
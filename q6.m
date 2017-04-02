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
}

for i = 1: size(pics)
    im = imread(pics{i});
    var = size(size(im));
    if(var(2) == 3)
        im = rgb2gray(im);
    end
    
    im = imresize(im, [256 256]); 
    
    temp1 = im;
    temp2 = im;
    temp = im;
    
    temp(:,:,1) = dct2(temp1(:,:,1));
    
     for i=1:256
        for j=1:256
            if((i+j)>125)
               temp(i,j,1)=0;
               temp(i,j,2)=0;
               temp(i,j,3)=0;
            end
        end
     end
     
    temp1(:,:,1) = idct2(temp(:,:,1));
    
    figure; subplot(1,2,1); imshow(temp1);
    disp(RMSE(im, temp1));
    %figure; imshow(im); title(pics{i});
end
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
    figure; imshow(im); title(pics{i});
end
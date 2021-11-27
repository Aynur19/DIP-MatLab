clc;
close all;
clear all;

size = 1000;
img = zeros(size, size);

length = 5;
drawedLength = 1;
while drawedLength+length < size
    img(:, drawedLength:drawedLength+length) = length;
    drawedLength =  drawedLength + length;
    length = length * 2;
end


img(:, drawedLength:size) = length;
img = img/max(img(:));

figure(); imshow(img); title('Vertical Stripes from Black to White');
imwrite(img, 'results/lab01_opt08_task01_01.jpg');
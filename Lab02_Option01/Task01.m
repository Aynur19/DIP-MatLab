clc;
close all;
clear all;

img = imread('resources/Img2_01_1.jpg');
% figure(); imshow(img); title('Original Image');

count = 10;
luminanceSumArray = sort(sum(img, 3), 'descend');
% minMax



levelDelta = 0.001;
level = 0.99;
BW = im2bw(img, level);

while sum(BW(:)) > 10
    level = level + levelDelta;
    BW = im2bw(img, level);    
end

figure(); imshow(BW); title('Binary Image: Threshold = ' + string(level));
imwrite(BW, 'results/lab02_opt01_task01_01.png');

[sizeY, sizeX, sizeRGB] = size(img);
XX = zeros(10, 2);
labels = strings(10, 1);

index = 1;
for i=1:sizeY
    for j=1:sizeX
        if BW(i, j) == 1
           XX(index, 1) = i;
           XX(index, 2) = j;
           labels(index, 1) = '[' + string(i) + '; ' + string(j) +  ']';
           index = index + 1;
        end
    end
end

scatter(XX(:, 2), XX(:, 1), 'black', '.');
text(XX(:, 2), XX(:, 1), labels, 'horizontal', 'left', 'vertical', 'bottom', 'FontSize', 8, 'Color', 'red');
title('Point coordinates');
saveas(gcf, 'results/lab02_opt01_task01_02.png');

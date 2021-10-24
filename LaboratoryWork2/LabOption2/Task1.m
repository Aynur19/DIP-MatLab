clc;
clear all;
close all;

imgOrigin = imread('resources/Img2_02_1.jpg');
figure();
imshow(imgOrigin); title('Original Image');

bw = double(imbinarize(imgOrigin, 0.3));
figure();
imshow(bw); title('Binarized Image (Threshold = 0.3)');
imwrite(bw, 'results/l2_o2_t1_1.png');

bw = double(imbinarize(imgOrigin, 0.5));
figure();
imshow(bw); title('Binarized Image (Threshold = 0.5)');
imwrite(bw, 'results/l2_o2_t1_2.png');

bw = double(imbinarize(imgOrigin, 0.8));
figure();
imshow(bw); title('Binarized Image (Threshold = 0.8)');
imwrite(bw, 'results/l2_o2_t1_3.png');

bw = double(imbinarize(imgOrigin, 0.9));
figure();
imshow(bw); title('Binarized Image (Threshold = 0.9)');
imwrite(bw, 'results/l2_o2_t1_4.png');
clc;
clear all;
close all;

img = imread('resources/Img2_02_1.jpg');
figure(); imshow(img); title('Original Image');

BW = double(imbinarize(img, 0.3));
figure(); imshow(BW); title('Binarized Image (Threshold=0.3)');
imwrite(BW, 'results/lab02_opt02_task01_01.png');

BW = double(imbinarize(img, 0.5));
figure(); imshow(BW); title('Binarized Image (Threshold=0.5)');
imwrite(BW, 'results/lab02_opt02_task01_02.png');

BW = double(imbinarize(img, 0.8));
figure(); imshow(BW); title('Binarized Image (Threshold=0.8)');
imwrite(BW, 'results/lab02_opt02_task01_03.png');

BW = double(imbinarize(img, 0.9));
figure(); imshow(BW); title('Binarized Image (Threshold=0.9)');
imwrite(BW, 'results/lab02_opt02_task01_04.png');

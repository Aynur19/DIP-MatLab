clc;
clear all;
close all;

% INPUT IMAGE
img = imread('resources/Pic_22_2.jpg');         
figure(); imshow(img); title('Original Image'); pause;       


% HALF-TONE IMAGE
imgGray = rgb2gray(img);

figure(); imshow(imgGray); title('Grayscale Image'); pause;         
imwrite(imgGray,'results/lab01_opt07_task02_01.jpg');  


% NEGATIVE IMAGE
imgNeg = 255 - img;
imshow(imgNeg); title('Negative Image'); pause;
imwrite(imgNeg, 'results/lab01_opt07_task02_02.jpg');  


% GRAY HALF-TONE IMAGE
grayscaleCount = 10;
imgGrayGradationsN = round(rgb2gray(img)/(255/10))*(255/10);

imshow(imgGrayGradationsN); title('Grayscale N Graddations Image'); pause;
imwrite(imgGrayGradationsN, 'results/lab01_opt07_task02_03.jpg');  


% TRANSLATING HALF-TONE IMAGE TO PALETTE IMAGE
palette = winter(255);
imgPalette = rgb2gray(img);

imshow(imgPalette, palette);  title('Winter Palette Image'); pause;
imwrite(imgPalette, palette, 'results/lab01_opt07_task02_04.jpg');
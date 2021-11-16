clc;
clear all;
close all;

%маска лапласиана
W1 = [1 1 1; 1 -8 1; 1 1 1]; 
W2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
W3 = [0 1 0; 1 -4 1; 0 1 0];
W4 = [0 -1 0; -1 4 -1; 0 -1 0];

imgOrigin = imread('resources/Img3_01_1.jpg');
imgOriginGray = im2double(rgb2gray(imgOrigin));

imgBlure = imgaussfilt(imgOriginGray, 4.0); 

% figure(1); tiledlayout(3, 3, 'TileSpacing', 'tight');
% nexttile; imshow(imgOrigin); title('Исходное изображение');
% nexttile; imshow(imgOriginGray); title('Исходное полутоновое изображение');
% nexttile; 
figure();
imshow(imgBlure); title('Полутоновое изображение, размытое гауссовским фильтром');

G1 = imfilter(imgBlure, W1, 'replicate');
GL1 = histeq(imgBlure - G1);

G2 = imfilter(imgBlure, W2, 'replicate');
GL2 = histeq(imgBlure - G2);

G3 = imfilter(imgBlure, W3, 'replicate');
GL3 = histeq(imgBlure - G3);

G4 = imfilter(imgBlure, W4, 'replicate');
GL4 = histeq(imgBlure - G4);


 
imgBlure256 = uint8(round(255 * imgBlure)); % перевод в формат uint8
sigma = 0.2; % параметр функ. locallapfilt [0, 1]
alpha = 0.4; % параметр функ. locallapfilt [0.1, 10]
beta = 1.5; % параметр функ. locallapfilt [0, 5]

C = locallapfilt(imgBlure256, sigma, alpha, beta);

% figure(1); tiledlayout(2, 4, 'TileSpacing', 'tight');
% nexttile; imshow(imgOrigin); title('Исходное изображение');
% nexttile; imshow(imgOriginGray); title('Исходное полутоновое изображение');
% nexttile; imshow(imgBlure); title('Полутоновое изображение, размытое гауссовским фильтром');
% nexttile; imshow(GL1); title('Лапласиан [1 1 1; 1 -8 1; 1 1 1]');
% nexttile; imshow(GL2); title('Лапласиан [-1 -1 -1; -1 8 -1; -1 -1 -1]');
% nexttile; imshow(GL3); title('Лапласиан [0 1 0; 1 -4 1; 0 1 0]');
% nexttile; imshow(GL4); title('Лапласиан [0 -1 0; -1 4 -1; 0 -1 0]');
% nexttile; imshow(C); title('Лапласиан locallapfilt');

WX1 = [-1 -2 -1; 0 0 0; 1 2 1];
WY1 = [-1 0 1; -2 0 2; -1 0 1];
GX1 = imfilter(imgBlure, WX1, 'replicate');
GY1 = imfilter(imgBlure, WY1, 'replicate');
GSOB1 = abs(GX1) + abs(GY1);
GLSOB1 = imgBlure + GSOB1;
figure();
imshow(GLSOB1, []); title('Собел');

WX2 = [-2 -8 -2; 0 0 0; 2 8 2];
WY2 = [-2 0 2; -8 0 8; -2 0 2];
GX2 = imfilter(imgBlure, WX2, 'replicate');
GY2 = imfilter(imgBlure, WY2, 'replicate');
GSOB2 = abs(GX2) + abs(GY2);
GLSOB2 = imgBlure + GSOB2;
figure();
imshow(GLSOB2, []); title('Собел2');


clc;
clear all;
close all;

%% 1. Считывание изображения
img = imread('resources/A6_01_1.jpg');
imgGray = rgb2gray(img);
[sizeY, sizeX] = size(imgGray);    % размер изображения

figure(); imshow(img); title('Исходное изображение');
figure(); imshow(imgGray); title('Полутоновое изображение');


%% 2. Добавление периодического шума
N1 = zeros(sizeY,sizeX); 
N2 = zeros(sizeY,sizeX);
u0 = 40; 
v0 = 0;
for im = 1:sizeY
    for in = 1:sizeX
         xa = 2*pi*u0*im/sizeY; 
         ya = 2*pi*v0*in/sizeX;
         N1(im,in) = sin(xa+ya);
         
         xa = 2*pi*v0*im/sizeY; 
         ya = 2*pi*u0*in/sizeX;
         N2(im,in) = sin(xa+ya);
     end
end
imgNoisy = double(imgGray) + 1.5*N1;% + 1.5*N2;
figure(); imshow(imgNoisy,[]); title('Зашумленное изображение')
% FA = real(ifftshift(fft2(imgNoisy)));
% FA = FA-min(FA(:));
% FA = FA/max(FA(:));
% 179
% FA = log(1+FA);
% figure(21); imshow(FA,[]); pause;


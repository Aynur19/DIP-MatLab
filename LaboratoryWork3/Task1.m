clc;
clear all;
close all;

imgOrigin = imread('resources/Img3_01_1.jpg');
figure();
imshow(imgOrigin); title('Оригинальное изображение');

% ПРИМЕНЕНИЕ ГАУССОВСКОГО ШУМА
J = imnoise(imgOrigin, 'gaussian'); % нулевое среднее значение гауссовского шума с дисперсией 0,01
figure();
imshow(J); title('Применение нулевого среднего значения гауссовского шума с дисперсией 0.01');
imwrite(J, 'results/l3_o1_t1_gaussian_0.00_0.01.jpg');

J = imnoise(imgOrigin, 'gaussian', 0.25); % гауссовскией шума с дисперсией 0,01 и средним значением 0,25
figure();
imshow(J); title('Применение гауссовского шума с дисперсией 0.01 и средним значением 0.25');
imwrite(J, 'results/l3_o1_t1_gaussian_0.25_0.01.jpg');

J = imnoise(imgOrigin, 'gaussian', 0.25, 0.05);
figure();
imshow(J); title('Применение гауссовского шума с дисперсией 0.05 и средним значением 0.25');
imwrite(J, 'results/l3_o1_t1_gaussian_0.25_0.05.jpg');

% ПРИМЕНЕНИЕ ШУМА ТИПА "СОЛЬ И ПЕРЕЦ"
J = imnoise(imgOrigin, 'salt & pepper');
figure();
imshow(J); title('Применение шума типа "соль и перец" с плотностью шума по умолчанию 0.05');
imwrite(J, 'results/l3_o1_t1_salt&pepper_0.05.jpg');

J = imnoise(imgOrigin, 'salt & pepper', 0.25);
figure();
imshow(J); title('Применение шума типа "соль и перец" с плотностью шума 0.25');
imwrite(J, 'results/l3_o1_t1_salt&pepper_0.25.jpg');

J = imnoise(imgOrigin, 'salt & pepper', 0.50);
figure();
imshow(J); title('Применение шума типа "соль и перец" с плотностью шума 0.50');
imwrite(J, 'results/l3_o1_t1_salt&pepper_0.50.jpg');
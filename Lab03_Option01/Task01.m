clc;
clear all;
close all;

img = imread('resources/Img3_01_1.jpg');
figure(); imshow(img); title('Original image');

% APPLICATION OF GAUSSIAN NOISE
J = imnoise(img, 'gaussian');
figure(); imshow(J); title('Gaussian noise (mean 0, variance 0.01)');
imwrite(J, 'results/lab03_opt01_task01_gaussian_01.jpg');

J = imnoise(img, 'gaussian', 0.25);
figure(); imshow(J); title('Gaussian noise (mean 0.25, variance 0.01)');
imwrite(J, 'results/lab03_opt01_task01_gaussian_02.jpg');

J = imnoise(img, 'gaussian', 0.25, 0.05);
figure(); imshow(J); title('Gaussian noise (mean 0.25, variance 0.05)');
imwrite(J, 'results/lab03_opt01_task01_gaussian_03.jpg');

% APPLICATION OF "SALT AND PEPPER" NOISE
J = imnoise(img, 'salt & pepper');
figure(); imshow(J); title('"Salt and pepper" noise (density 0.05)');
imwrite(J, 'results/lab03_opt01_task01_salt&pepper_01.jpg');

J = imnoise(img, 'salt & pepper', 0.25);
figure(); imshow(J); title('"Salt and pepper" noise (density 0.25)');
imwrite(J, 'results/lab03_opt01_task01_salt&pepper_02.jpg');

J = imnoise(img, 'salt & pepper', 0.50);
figure(); imshow(J); title('"Salt and pepper" noise (density 0.50)');
imwrite(J, 'results/lab03_opt01_task01_salt&pepper_03.jpg');
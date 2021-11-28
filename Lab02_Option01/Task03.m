clc;
clear all;
close all;

img = imread('resources/Img2_01_3.jpg');
figure(); imshow(img); title('Original Image');
figure(); histogram(img); title('Original Image brightness histogram');
saveas(gcf, 'results/lab02_opt01_task03_01.png')    

P2 = imadjust(img, [], [], 25.0);
figure(); imshow(P2); title('Image after imadjust(gamma=25.0)');
figure(); histogram(P2); title('Image histogram after imadjust(gamma=25.0)');
imwrite(P2, 'results/lab02_opt01_task03_02.png');
saveas(gcf, 'results/lab02_opt01_task03_03.png')

PE = histeq(img); 
figure(); imshow(PE); title('Image after histeq()');
figure(); histogram(PE); title('Image histogram after histeq()');
imwrite(PE, 'results/lab02_opt01_task03_04.png');
saveas(gcf, 'results/lab02_opt01_task03_05.png')

B = imadjust(img, [], [], 50.0);
B = imlocalbrighten(B, 0.5);
figure(); imshow(B); title('Image after imadjust(gamma=50.0) + imlocalbrighten()');
figure(); histogram(B); title('Image histogram after imadjust(gamma=50.0) + imlocalbrighten()');
imwrite(B, 'results/lab02_opt01_task03_06.png');
saveas(gcf, 'results/lab02_opt01_task03_07.png')

% gray = rgb2gray(img);
% imshow(gray);
% imcontrast();
imgImcontrast = imread('results/lab02_opt01_task03_08.png');
figure(); imshow(imgImcontrast); title('Image after imcontrast()');
figure(); histogram(imgImcontrast); title('Image histogram after imcontrast()');
saveas(gcf, 'results/lab02_opt01_task03_09.png')

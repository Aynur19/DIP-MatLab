clc;
clear all;
close all;

% маски фильтрации
maskAvgFilt = @(x) (1/9)*sum(x(:));
maskAvgGeomFilt = @(x) prod(x(:))^(1/9); 
maskAvgHarmonicFilt = @(x) 9/(sum(1./x, 'all'));
maskMedianFilt = @(x) median(x(:));

% ========================================================================
% фильтрация зашумленного изображение гауссовским шумом (среднее 0,
% дисперсия 0.01)
imgNoisy = imread('results/l3_o1_t1_gaussian_0.00_0.01.jpg');
imgNoisyGray = im2double(rgb2gray(imgNoisy));
A1 = nlfilter(imgNoisyGray, [3 3], maskAvgFilt); 
A2 = nlfilter(imgNoisyGray, [3 3], maskAvgGeomFilt); 
A3 = nlfilter(imgNoisyGray, [3 3], maskAvgHarmonicFilt); 
A4 = nlfilter(imgNoisyGray, [3 3], maskMedianFilt); 

figure(1); tiledlayout(2, 3, 'TileSpacing', 'tight');
nexttile; imshow(imgNoisy); title('Зашумленное изображение (гаус., сред 0, дисперсия 0.01)');
nexttile; imshow(imgNoisyGray); title('Зашумленное полутоновое изображение');
nexttile; imshow(A1); title('Среднеарифметическая фильтрация');
nexttile; imshow(A2); title('Среднегеометрическая фильтрация');
nexttile; imshow(A3); title('Среднегармоническая фильтрация');
nexttile; imshow(A4); title('Медианная фильтрация');

imwrite(imgNoisyGray, 'results/l3_o1_t2_gaussian_0.00_0.01_gray.jpg');
imwrite(A1, 'results/l3_o1_t2_gaussian_0.00_0.01_avgFilter.jpg');
imwrite(A2, 'results/l3_o1_t2_gaussian_0.00_0.01_avgGeomFilter.jpg');
imwrite(A3, 'results/l3_o1_t2_gaussian_0.00_0.01_avgHarmohic.jpg');
imwrite(A4, 'results/l3_o1_t2_gaussian_0.00_0.01_medianFilter.jpg');


% ========================================================================
% фильтрация зашумленного изображение гауссовским шумом (среднее 0.25,
% дисперсия 0.01)
imgNoisy = imread('results/l3_o1_t1_gaussian_0.25_0.01.jpg');
imgNoisyGray = im2double(rgb2gray(imgNoisy));
A1 = nlfilter(imgNoisyGray, [3 3], maskAvgFilt); 
A2 = nlfilter(imgNoisyGray, [3 3], maskAvgGeomFilt); 
A3 = nlfilter(imgNoisyGray, [3 3], maskAvgHarmonicFilt); 
A4 = nlfilter(imgNoisyGray, [3 3], maskMedianFilt); 

figure(2); tiledlayout(2, 3, 'TileSpacing', 'tight');
nexttile; imshow(imgNoisy); title('Зашумленное изображение (гаус., сред 0.25, дисперсия 0.01)');
nexttile; imshow(imgNoisyGray); title('Зашумленное полутоновое изображение');
nexttile; imshow(A1); title('Среднеарифметическая фильтрация');
nexttile; imshow(A2); title('Среднегеометрическая фильтрация');
nexttile; imshow(A3); title('Среднегармоническая фильтрация');
nexttile; imshow(A4); title('Медианная фильтрация');

imwrite(imgNoisyGray, 'results/l3_o1_t2_gaussian_0.25_0.01_gray.jpg');
imwrite(A1, 'results/l3_o1_t2_gaussian_0.25_0.01_avgFilter.jpg');
imwrite(A2, 'results/l3_o1_t2_gaussian_0.25_0.01_avgGeomFilter.jpg');
imwrite(A3, 'results/l3_o1_t2_gaussian_0.25_0.01_avgHarmohic.jpg');
imwrite(A4, 'results/l3_o1_t2_gaussian_0.25_0.01_medianFilter.jpg');

% ========================================================================
% фильтрация зашумленного изображение гауссовским шумом (среднее 0.25,
% дисперсия 0.05)
imgNoisy = imread('results/l3_o1_t1_gaussian_0.25_0.05.jpg');
imgNoisyGray = im2double(rgb2gray(imgNoisy));
A1 = nlfilter(imgNoisyGray, [3 3], maskAvgFilt); 
A2 = nlfilter(imgNoisyGray, [3 3], maskAvgGeomFilt); 
A3 = nlfilter(imgNoisyGray, [3 3], maskAvgHarmonicFilt); 
A4 = nlfilter(imgNoisyGray, [3 3], maskMedianFilt); 

figure(3); tiledlayout(2, 3, 'TileSpacing', 'tight');
nexttile; imshow(imgNoisy); title('Зашумленное изображение (гаус., сред 0.25, дисперсия 0.05)');
nexttile; imshow(imgNoisyGray); title('Зашумленное полутоновое изображение');
nexttile; imshow(A1); title('Среднеарифметическая фильтрация');
nexttile; imshow(A2); title('Среднегеометрическая фильтрация');
nexttile; imshow(A3); title('Среднегармоническая фильтрация');
nexttile; imshow(A4); title('Медианная фильтрация');

imwrite(imgNoisyGray, 'results/l3_o1_t2_gaussian_0.25_0.05_gray.jpg');
imwrite(A1, 'results/l3_o1_t2_gaussian_0.25_0.05_avgFilter.jpg');
imwrite(A2, 'results/l3_o1_t2_gaussian_0.25_0.05_avgGeomFilter.jpg');
imwrite(A3, 'results/l3_o1_t2_gaussian_0.25_0.05_avgHarmohic.jpg');
imwrite(A4, 'results/l3_o1_t2_gaussian_0.25_0.05_medianFilter.jpg');

% ========================================================================
% фильтрация зашумленного изображение шумом типа "соль и перец" (плотность шума 0.05)
imgNoisy = imread('results/l3_o1_t1_salt&pepper_0.05.jpg');
imgNoisyGray = im2double(rgb2gray(imgNoisy));
A1 = nlfilter(imgNoisyGray, [3 3], maskAvgFilt); 
A2 = nlfilter(imgNoisyGray, [3 3], maskAvgGeomFilt); 
A3 = nlfilter(imgNoisyGray, [3 3], maskAvgHarmonicFilt); 
A4 = nlfilter(imgNoisyGray, [3 3], maskMedianFilt); 

figure(4); tiledlayout(2, 3, 'TileSpacing', 'tight');
nexttile; imshow(imgNoisy); title('Зашумленное изображение ("соль и перец", плотность шума 0.05)');
nexttile; imshow(imgNoisyGray); title('Зашумленное полутоновое изображение');
nexttile; imshow(A1); title('Среднеарифметическая фильтрация');
nexttile; imshow(A2); title('Среднегеометрическая фильтрация');
nexttile; imshow(A3); title('Среднегармоническая фильтрация');
nexttile; imshow(A4); title('Медианная фильтрация');

imwrite(imgNoisyGray, 'results/l3_o1_t2_salt&pepper_0.05_gray.jpg');
imwrite(A1, 'results/l3_o1_t2_salt&pepper_0.05_avgFilter.jpg');
imwrite(A2, 'results/l3_o1_t2_salt&pepper_0.05_avgGeomFilter.jpg');
imwrite(A3, 'results/l3_o1_t2_salt&pepper_0.05_avgHarmohic.jpg');
imwrite(A4, 'results/l3_o1_t2_salt&pepper_0.05_medianFilter.jpg');


% ========================================================================
% фильтрация зашумленного изображение шумом типа "соль и перец" (плотность шума 0.25)
imgNoisy = imread('results/l3_o1_t1_salt&pepper_0.25.jpg');
imgNoisyGray = im2double(rgb2gray(imgNoisy));
A1 = nlfilter(imgNoisyGray, [3 3], maskAvgFilt); 
A2 = nlfilter(imgNoisyGray, [3 3], maskAvgGeomFilt); 
A3 = nlfilter(imgNoisyGray, [3 3], maskAvgHarmonicFilt); 
A4 = nlfilter(imgNoisyGray, [3 3], maskMedianFilt); 

figure(5); tiledlayout(2, 3, 'TileSpacing', 'tight');
nexttile; imshow(imgNoisy); title('Зашумленное изображение ("соль и перец", плотность шума 0.25)');
nexttile; imshow(imgNoisyGray); title('Зашумленное полутоновое изображение');
nexttile; imshow(A1); title('Среднеарифметическая фильтрация');
nexttile; imshow(A2); title('Среднегеометрическая фильтрация');
nexttile; imshow(A3); title('Среднегармоническая фильтрация');
nexttile; imshow(A4); title('Медианная фильтрация');

imwrite(imgNoisyGray, 'results/l3_o1_t2_salt&pepper_0.25_gray.jpg');
imwrite(A1, 'results/l3_o1_t2_salt&pepper_0.25_avgFilter.jpg');
imwrite(A2, 'results/l3_o1_t2_salt&pepper_0.25_avgGeomFilter.jpg');
imwrite(A3, 'results/l3_o1_t2_salt&pepper_0.25_avgHarmohic.jpg');
imwrite(A4, 'results/l3_o1_t2_salt&pepper_0.25_medianFilter.jpg');


% ========================================================================
% фильтрация зашумленного изображение шумом типа "соль и перец" (плотность шума 0.50)
imgNoisy = imread('results/l3_o1_t1_salt&pepper_0.50.jpg');
imgNoisyGray = im2double(rgb2gray(imgNoisy));
A1 = nlfilter(imgNoisyGray, [3 3], maskAvgFilt); 
A2 = nlfilter(imgNoisyGray, [3 3], maskAvgGeomFilt); 
A3 = nlfilter(imgNoisyGray, [3 3], maskAvgHarmonicFilt); 
A4 = nlfilter(imgNoisyGray, [3 3], maskMedianFilt); 

figure(6); tiledlayout(2, 3, 'TileSpacing', 'tight');
nexttile; imshow(imgNoisy); title('Зашумленное изображение ("соль и перец", плотность шума 0.50)');
nexttile; imshow(imgNoisyGray); title('Зашумленное полутоновое изображение');
nexttile; imshow(A1); title('Среднеарифметическая фильтрация');
nexttile; imshow(A2); title('Среднегеометрическая фильтрация');
nexttile; imshow(A3); title('Среднегармоническая фильтрация');
nexttile; imshow(A4); title('Медианная фильтрация');

imwrite(imgNoisyGray, 'results/l3_o1_t2_salt&pepper_0.50_gray.jpg');
imwrite(A1, 'results/l3_o1_t2_salt&pepper_0.50_avgFilter.jpg');
imwrite(A2, 'results/l3_o1_t2_salt&pepper_0.50_avgGeomFilter.jpg');
imwrite(A3, 'results/l3_o1_t2_salt&pepper_0.50_avgHarmohic.jpg');
imwrite(A4, 'results/l3_o1_t2_salt&pepper_0.50_medianFilter.jpg');
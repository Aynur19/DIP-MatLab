clc;
clear all;
close all;

% FILTERING MASKS
maskAvgFilt = @(x) (1/9)*sum(x(:));
maskAvgGeomFilt = @(x) prod(x(:))^(1/9); 
maskAvgHarmonicFilt = @(x) 9/(sum(1./x, 'all'));
maskMedianFilt = @(x) median(x(:));

% filtering a noisy image with Gaussian noise
filteringBy4Masks('results/lab03_opt01_task01_gaussian_01', '.jpg', ...
    'Gaussian noise (mean 0, variance 0.01)', 'results/lab03_opt01_task02_gaussian_01', ...
    maskAvgFilt, maskAvgGeomFilt, maskAvgHarmonicFilt, maskMedianFilt);

filteringBy4Masks('results/lab03_opt01_task01_gaussian_02', '.jpg', ...
    'Gaussian noise (mean 0.25, variance 0.01)', 'results/lab03_opt01_task02_gaussian_02', ...
    maskAvgFilt, maskAvgGeomFilt, maskAvgHarmonicFilt, maskMedianFilt);

filteringBy4Masks('results/lab03_opt01_task01_gaussian_03', '.jpg', ...
    'Gaussian noise (mean 0.25, variance 0.05)', 'results/lab03_opt01_task02_gaussian_03', ...
    maskAvgFilt, maskAvgGeomFilt, maskAvgHarmonicFilt, maskMedianFilt);

% filtering a noisy image with "Salt & Pepper" noise
filteringBy4Masks('results/lab03_opt01_task01_salt&pepper_01', '.jpg', ...
    'Gaussian noise (density 0.05)', 'results/lab03_opt01_task02_salt&pepper_01', ...
    maskAvgFilt, maskAvgGeomFilt, maskAvgHarmonicFilt, maskMedianFilt);

filteringBy4Masks('results/lab03_opt01_task01_salt&pepper_02', '.jpg', ...
    'Gaussian noise (density 0.25)', 'results/lab03_opt01_task02_salt&pepper_02', ...
    maskAvgFilt, maskAvgGeomFilt, maskAvgHarmonicFilt, maskMedianFilt);

filteringBy4Masks('results/lab03_opt01_task01_salt&pepper_03', '.jpg', ...
    'Gaussian noise (density 0.50)', 'results/lab03_opt01_task02_salt&pepper_03', ...
    maskAvgFilt, maskAvgGeomFilt, maskAvgHarmonicFilt, maskMedianFilt);


function filteringBy4Masks(inPath, inFormat, imgTitle, outPath, ...
    maskAvgFilt, maskAvgGeomFilt, maskAvgHarmonicFilt, maskMedianFilt)
    imgNoisy = imread(string(inPath) + string(inFormat));
    imgNoisyGray = im2double(rgb2gray(imgNoisy));
    A1 = nlfilter(imgNoisyGray, [3 3], maskAvgFilt); 
    A2 = nlfilter(imgNoisyGray, [3 3], maskAvgGeomFilt); 
    A3 = nlfilter(imgNoisyGray, [3 3], maskAvgHarmonicFilt); 
    A4 = nlfilter(imgNoisyGray, [3 3], maskMedianFilt); 

    figure(); tiledlayout(2, 3, 'TileSpacing', 'tight');
    nexttile; imshow(imgNoisy); title(imgTitle);
    nexttile; imshow(imgNoisyGray); title('Grayscale' + string(imgTitle));
    nexttile; imshow(A1); title('Arithmetic mean filtering');
    nexttile; imshow(A2); title('Geometric mean filtration');
    nexttile; imshow(A3); title('Medium Harmonic Filtering');
    nexttile; imshow(A4); title('Median filtering');

    imwrite(imgNoisyGray, string(outPath) + '_gray' + string(inFormat));
    imwrite(A1, string(outPath) + '_avgFilter' + string(inFormat));
    imwrite(A2, string(outPath) + '_avgGeomFilter' + string(inFormat));
    imwrite(A3, string(outPath) + '_avgHarmonicFilter' + string(inFormat));
    imwrite(A4, string(outPath) + '_medianFilter' + string(inFormat));
end

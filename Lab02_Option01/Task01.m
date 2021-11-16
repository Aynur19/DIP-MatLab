clc;
clear all; 
close all;

imgSizeX = 1001;
imgSizeY = 1001;
imgCX = round(imgSizeX/2);
imgCY = round(imgSizeY/2);

rectSizeX = 201;
rectSizeY = 81;
rectHSX = floor(rectSizeX/2);
rectHSY = floor(rectSizeY/2);

img = zeros(imgSizeY, imgSizeX);
img(imgCY-rectHSY:imgCY+rectHSY, imgCX-rectHSX:imgCX+rectHSX) = ones(rectSizeY, rectSizeX);
figure(1); imshow(img, []); title('White rectangle'); pause;
imwrite(img, 'results/lab02_opt02_task02_01.png');

B = abs(fftshift(fft2(img))); 
figure(1); imshow(B, []); title('Centered spectrum of a rectangle'); pause;
imwrite(B, 'results/lab02_opt02_task02_02.png');

BL = log(1+2*B);
figure(1); imshow(BL, []); title('Spectrum of a rectangle after logarithmic transformation'); pause;
imwrite(BL, 'results/lab02_opt02_task02_03.png');

img2 = zeros(imgSizeY, imgSizeX);
img2(1:rectSizeY, 1:rectSizeX) = ones(rectSizeY, rectSizeX);
figure(2); imshow(img2); title('White rectangle (2)'); pause;
imwrite(img2, 'results/lab02_opt02_task02_04.png');

B2 = abs(fftshift(fft2(img2))); 
figure(2); imshow(B2, []); title('Centered spectrum of a rectangle (2)'); pause;
imwrite(B2, 'results/lab02_opt02_task02_05.png');

BL2 = log(1+0.1*B2);
figure(2); imshow(BL2, []); title('Spectrum of a rectangle after logarithmic transformation(2)'); pause;
imwrite(BL2, 'results/lab02_opt02_task02_06.png');

drawSpectrumCenterLines(B, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum value before logarithmic transformation with a cross-section in the middle', ...
    'results/lab02_opt02_task02_07.png')

drawSpectrumCenterLines(BL, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum value after logarithmic transformation over the cross-section in the middle', ...
    'results/lab02_opt02_task02_08.png')

drawSpectrumCenterLines(B2, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum value before logarithmic transformation with a cross-section in the middle (2)', ...
    'results/lab02_opt02_task02_09.png')

drawSpectrumCenterLines(BL2, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum value after logarithmic transformation over the cross-section in the middle (2)', ...
    'results/lab02_opt02_task02_10.png')


function drawSpectrumCenterLines(B, y, x, ySize, xSize, figTitle, path)
    title(figTitle);
    figure;
    plot(normalize(B(y, 1:xSize),'range'));
    hold on;
    grid on;
    plot(normalize(B(1:ySize, x),'range'));
    hold off;
    saveas(gcf, path)
end
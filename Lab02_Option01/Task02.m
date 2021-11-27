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

K = [0.01, 1, 100];

% RECTANGLE IN THE CENTER
img = zeros(imgSizeY, imgSizeX);
img(imgCY-rectHSY:imgCY+rectHSY, imgCX-rectHSX:imgCX+rectHSX) = ones(rectSizeY, rectSizeX);
figure(); imshow(img, []); title('White rectangle'); 
imwrite(img, 'results/lab02_opt01_task02_01.png');

B = abs(fftshift(fft2(img))); 
figure(); imshow(B, []); title('Spectrum => abs(fftshift(fft2(img)))'); 
imwrite(B/max(B(:)), 'results/lab02_opt01_task02_02.png');

BL = log(1+K(1)*B);
figure(); imshow(BL, []); title('Spectrum => log(1+0.01*B)'); 
imwrite(BL/max(BL(:)), 'results/lab02_opt01_task02_03.png');

BL = log(1+K(2)*B);
figure(); imshow(BL, []); title('Spectrum => log(1+1*B)'); 
imwrite(BL/max(BL(:)), 'results/lab02_opt01_task02_04.png');

BL = log(1+K(3)*B);
figure(); imshow(BL, []); title('Spectrum => log(1+100*B)'); 
imwrite(BL/max(BL(:)), 'results/lab02_opt01_task02_05.png');

BL = log(1+K(2)*B);

drawSpectrumCenterLines(B, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum => abs(fftshift(fft2(img)))', 'results/lab02_opt01_task02_06.png')

drawSpectrumCenterLines(BL, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum => log(1+1*B)', 'results/lab02_opt01_task02_07.png')


% RECTANGLE IN CORNER
img2 = zeros(imgSizeY, imgSizeX);
img2(1:rectSizeY, 1:rectSizeX) = ones(rectSizeY, rectSizeX);
figure(); imshow(img2); title('White rectangle (2)');
imwrite(img2, 'results/lab02_opt01_task02_08.png');

B2 = abs(fftshift(fft2(img2))); 
figure(); imshow(B2, []); title('Spectrum => abs(fftshift(fft2(img2))) (2)');
imwrite(B2/max(B2(:)), 'results/lab02_opt01_task02_09.png');

BL2 = log(1+K(1)*B2);
figure(); imshow(BL2, []); title('Spectrum => log(1+0.01*B2) (2)'); 
imwrite(BL2/max(BL2(:)), 'results/lab02_opt01_task02_10.png');

BL2 = log(1+K(2)*B2);
figure(); imshow(BL2, []); title('Spectrum => log(1+1*B2) (2)'); 
imwrite(BL2/max(BL2(:)), 'results/lab02_opt01_task02_11.png');

BL2 = log(1+K(3)*B2);
figure(); imshow(BL2, []); title('Spectrum => log(1+100*B2) (2)');
imwrite(BL2/max(BL2(:)), 'results/lab02_opt01_task02_12.png');

BL2 = log(1+K(2)*B2);

drawSpectrumCenterLines(B2, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum => abs(fftshift(fft2(img2))) (2)', 'results/lab02_opt01_task02_13.png')

drawSpectrumCenterLines(BL2, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum => log(1+1*B2) (2)', 'results/lab02_opt01_task02_14.png')


function drawSpectrumCenterLines(B, y, x, ySize, xSize, figTitle, path)
    figure;
    plot(normalize(B(y, 1:xSize),'range'));
    hold on;
    grid on;
    plot(normalize(B(1:ySize, x),'range'));
    hold off;
    title(figTitle);
    saveas(gcf, path);
end
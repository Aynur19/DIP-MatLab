clc;
clear all;
close all;

imgSizeX = 1001;
imgSizeY = 1001;
[columnsInImage, rowsInImage] = meshgrid(1:imgSizeX, 1:imgSizeY);

centerX = round(imgSizeX/2);
centerY = round(imgSizeY/2);
radiusY = 201;
radiusX = 81;
img = getEllipse(imgSizeX, imgSizeY, centerX, centerY, radiusX, radiusY);

figure(); imshow(img); title('White Ellipse');
imwrite(img, 'results/lab02_opt02_task02_01.png');

K = [100, 1000, 100000];

B = abs(fftshift(fft2(img))); 
B = B/max(B(:));
figure(); imshow(B, []); title('Spectrum => abs(fftshift(fft2(img)))');
imwrite(B, 'results/lab02_opt02_task02_02.png');

BL = log(1 + K(1)*B); 
figure(); imshow(BL, []); title('Spectrum => log(1+' + string(K(1)) + '*B)');
imwrite(BL/max(BL(:)), 'results/lab02_opt02_task02_03.png');

BL = log(1 + K(2)*B); 
figure(); imshow(BL, []); title('Spectrum => log(1+' + string(K(2)) + '*B)');
imwrite(BL/max(BL(:)), 'results/lab02_opt02_task02_04.png');

BL = log(1 + K(3)*B); 
figure(); imshow(BL, []); title('Spectrum => log(1+' + string(K(3)) + '*B)');
imwrite(BL/max(BL(:)), 'results/lab02_opt02_task02_05.png');

imgCX = round(imgSizeX/2);
imgCY = round(imgSizeY/2);
BL = log(1+K(2)*B);

drawSpectrumCenterLines(B, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum => abs(fftshift(fft2(img)))', 'results/lab02_opt02_task02_06.png')

drawSpectrumCenterLines(BL, imgCY, imgCX, imgSizeY, imgSizeX, ...
    'Spectrum => log(1+1*B)', 'results/lab02_opt02_task02_07.png')


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


function ellipse = getEllipse(imgX, imgY, centerX, centerY, radiusX, radiusY)
    [columnsInImage, rowsInImage] = meshgrid(1:imgX, 1:imgY);
    ellipse = double((rowsInImage - centerY).^2 ./ radiusY^2 + (columnsInImage - centerX).^2 ./ radiusX^2 <= 1);
end
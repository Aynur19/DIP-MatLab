clc;
clear all;
close all;

imageSizeX = 1001;
imageSizeY = 1001;
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);

centerX = round(imageSizeX/2);
centerY = round(imageSizeY/2);
radiusY = 201;
radiusX = 81;
ellipsePixels = getEllipse(imageSizeX, imageSizeY, centerX, centerY, radiusX, radiusY);

img = ellipsePixels;
img  = (img-mean(img(:)))/max(img(:));
figure(); imshow(img); title('Binary image of a ellipse');
imwrite(img, 'results/lab2_opt2_task2_01.png');

CH = chessShifting(imageSizeX, imageSizeY);

% A = img.*CH;
% B = abs(fftshift(fft2(A)));
B = abs(fftshift(fft2(img))); 
B = B/max(B(:));
figure(); imshow(B, []); title('Centered ellipse spectrum');
imwrite(B, 'results/lab2_opt2_task2_2.png');

BL = log(1 + 1000*B); 
BL = BL/max(BL(:));
figure(); imshow(BL, []); title('Centered ellipse spectrum with logarithm translate');
imwrite(BL, 'results/lab2_opt2_task2_3.png');


function ellipse = getEllipse(imgX, imgY, centerX, centerY, radiusX, radiusY)
    [columnsInImage, rowsInImage] = meshgrid(1:imgX, 1:imgY);
    ellipse = double((rowsInImage - centerY).^2 ./ radiusY^2 + (columnsInImage - centerX).^2 ./ radiusX^2 <= 1);
end

function CH = chessShifting(m, n)
    CH = zeros(m, n);
    for im = 1:m
        for in = 1:n
            CH(im,in) = (-1)^(in+im);
        end
    end
end
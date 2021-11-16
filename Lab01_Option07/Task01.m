clc;
clear all;
close all;

% INPUT IMAGE
img = imread('resources/Pic_22_1.bmp'); 
imshow(img); title('Original Image'); pause;          


% GRID 
[rows, columns, numberOfColorChannels] = size(img); 
hold on;
stepSize = 100;                                       
lineWidth = 1;                                        
lineColor = [0 0 0];                                  


% DRAW GRID
for row = 1 : stepSize : rows
    img = insertShape(img, 'Line', [1 row columns row], 'LineWidth', lineWidth, 'Color', lineColor);
end

for col = 1 : stepSize : columns
    img = insertShape(img, 'Line', [col 1 col rows], 'LineWidth', lineWidth, 'Color', lineColor);
end

imshow(img); title('Original Image with Grid'); pause;   
imwrite(img, 'results/lab01_opt07_task01_01.bmp');                  


% SEMI-TRANSPARENT CIRCLE
circleCenterX = 800;            
circleCenterY = 500;
circleRadius = 150;
circleColor = [255 127 0];
circleOpacity = 0.5;


img = insertShape(img,'FilledCircle', [circleCenterX circleCenterY circleRadius],...
                      'Color', circleColor, 'Opacity', circleOpacity);

imshow(img); title('Original Image with Grid, Circle'); pause;
imwrite(img, 'results/lab01_opt07_task01_02.bmp');


% SEMI-TRANSPARENT SQUARE
squareX = 250;
squareY = 250;
squareSide = 200;
squareColor = [255 0 0];
squareOpacity = 0.5;

img = insertShape(img,'FilledRectangle', [squareX squareY squareSide squareSide],...
                      'Color', squareColor, 'Opacity', squareOpacity);
                  
imshow(img); title('Original Image + Grid + Circle + Square');
imwrite(img,'results/lab01_opt07_task01_03.bmp');

clc;
close all;
clear all;

size = 500;
A = 3;              % amplitude of wave
lambda = 20;        % wavelength in nanometers

x = linspace(0, size, size);    % vector from 0 to width
y = linspace(0, size, size);    % vector from 0 to height
[X, Y] = meshgrid(x , y);       % matrices of x and y values at each position

RW0=RingWave(A, X-(1), Y-(1), lambda);  
RW1=RingWave(A, X-(1), Y-(size), lambda);  

img = zeros(size, size, 3);
img(:, :, 1) = RW0+RW1;     % insert red waves
img = normalize(img, 'range');

figure(); imshow(img); title('Red and Blue Waves Interference');
imwrite(img, 'results/lab01_opt08_task02_01.jpg');

function RW = RingWave(amp, x, y, lambda)
    r1 = sqrt(x.*x+y.*y);   % dot notation: multiply element-wise
    RW = amp*cos(2*pi*r1/(lambda));
end

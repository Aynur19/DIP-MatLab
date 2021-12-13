clc;
close all;
clear all;

% загрузка матрицы изображения
img = load('resources/A5_01_1.mat', '-ascii');

% получение размеров изображения
[imgY, imgX] = size(img);

% ЦЕНТРИРОВАНИЕ СПЕКТРА ПУТЕМ ПРЕОБРАЗОВАНИЯ В ПРОСТРАНСТВЕННОЙ ОБЛАСТИ
% функция центрирования спектра
CH = zeros(imgY, imgX);
for in = 1:imgY
    for im = 1:imgX
        CH(in, im) = (-1)^(in+im);
    end
end

imgShifted_XY = img.*CH;                      % преобразование изображения в пространственной области
imgShiftedAS_XY = abs(fft2(imgShifted_XY));      % вычисление цетрированного АС изображения
imgShiftedASL_XY = log(1 + 10*imgShiftedAS_XY);  % логарифмическое преобразование центрированного АС изображения

% вывод изображений
figure(); imshow(img);                            title('Исходное изображение');
figure(); imshow(imgShifted_XY);                  title('Преобразованное изображение в пространственной области');
figure(); imshow(imgShiftedAS_XY, []);            title('Центрированный АС изображения');
figure(); imshow(imgShiftedASL_XY, []);           title('Центрированный АС после логарифмического преобразования');

% преобразование яркости для правильного сохранения
imgShiftedAS_XY = imgShiftedAS_XY/max(imgShiftedAS_XY(:));
imgShiftedASL_XY = imgShiftedASL_XY/max(imgShiftedASL_XY(:));

% сохранение изображений
imwrite(imgShifted_XY, 'results/lab05_opt01_task02_imgShifted_XY.jpg');
imwrite(imgShiftedAS_XY, 'results/lab05_opt01_task02_imgShiftedAS_XY.jpg');
imwrite(imgShiftedASL_XY, 'results/lab05_opt01_task02_imgShiftedASL_XY.jpg');


% ЦЕНТРИРОВАНИЕ СПЕКТРА ПУТЕМ ПРЕОБРАЗОВАНИЯ В ЧАСТОТНОЙ ОБЛАСТИ
imgShiftedAS_UV = fftshift(fft2(img));              % центрирование АС изображения в частотной области
imgShifted_UV =  real(ifft2(imgShiftedAS_UV));      % построение изображение в пространственной области, 
                                                    %   соответсвующее центрированному АС изображения в частотной области
imgShiftedAS_UV = abs(imgShiftedAS_UV);
imgShiftedASL_UV = log(1 + 10*imgShiftedAS_UV);     % логарифмическое преобразование центрированного АС изображения

% вывод изображений
figure(); imshow(imgShiftedAS_UV, []);       title('Центрированный АС изображения');
figure(); imshow(imgShiftedASL_UV, []);      title('Центрированный АС после логарифмического преобразования');
figure(); imshow(imgShifted_UV);             title('Преобразованное изображение в частотной области');

% преобразование яркости для правильного сохранения
imgShiftedAS_UV = imgShiftedAS_UV/max(imgShiftedAS_UV(:));
imgShiftedASL_UV = imgShiftedASL_UV/max(imgShiftedASL_UV(:));

% сохранение изображений
imwrite(imgShiftedAS_UV, 'results/lab05_opt01_task02_imgShiftedAS_UV.jpg');
imwrite(imgShiftedASL_UV, 'results/lab05_opt01_task02_imgShiftedASL_UV.jpg');
imwrite(imgShifted_UV, 'results/lab05_opt01_task02_imgShifted_UV.jpg');

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
imgShiftedAS_UV = abs(fftshift(fft2(img)));       % центрирование АС изображения в частотной области
imgShiftedASL_UV = log(1 + 10*imgShiftedAS_UV);   % логарифмическое преобразование центрированного АС изображения
imgShifted_UV =  real(ifft2(imgShiftedAS_UV));    % построение изображение в пространственной области, 
                                                  %   соответсвующее центрированному АС изображения в частотной области
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
% imwrite(imgFS/max(imgFS(:)), 'results/lab05_opt01_task01_imgOriginFS.jpg');
% 
% %HB = zeros(imgY, imgX);
% 
% % значения сдвига
% xShift = 100; % вправо на 100 пикселей
% yShift = 100; % вниз на 100 пикселей
% 
% % инициализация матрицы сдвинутого изобажения
% [xF, yF] = meshgrid(1:200, 1:200);
% 
% imgShiftedAS = imgAS.*exp(-1i*2*pi.*(xF*xShift + yF*yShift)/200);   % сдвиг спектра в частотой области => АС изображения после сдвига
% imgShiftedFS = angle(imgShiftedAS);                                 % вычисление ФС после сдвига
% imgShiftedASL = log(1 + 10*abs(imgShiftedAS));                      % логариф. преобразование АС изображения после сдвига
% imgShifted = abs(ifft2(imgShiftedAS));                   % получение изображения после сдвига
% imgShiftedAS = abs(imgShiftedAS);
% 
% % вывод координаты левого верхнего угла прямоугольника на изображении после сдвига
% printRectUpperLeftCornerCoords(imgShifted)
% 
% % вывод изображений
% figure(); imshow(imgShifted, []);                   title('Изображение после сдвига на 100 пикселей вправо и вниз');
% figure(); imshow(imgShiftedAS, []);                 title('АС изображения после сдвига');
% figure(); imshow(imgShiftedASL, []);                title('АС с логариф. преобразованием изображения после сдвига');
% figure(); imshow(imgShiftedFS, []); colormap(gray); title('ФС изображения после сдвига');
% 
% % сохранение изображений
% imwrite(imgShifted, 'results/lab05_opt01_task01_imgShifted.jpg');
% imwrite(imgShiftedAS/max(imgShiftedAS(:)), 'results/lab05_opt01_task01_imgShiftedAS.jpg');
% imwrite(imgShiftedASL/max(imgShiftedASL(:)), 'results/lab05_opt01_task01_imgShiftedASL.jpg');
% imwrite(imgShiftedFS/max(imgShiftedFS(:)), 'results/lab05_opt01_task01_imgShiftedFS.jpg');
% 
% % функция нахождения координаты левого верхнего угла прямоугольника и выводе на экран
% function printRectUpperLeftCornerCoords(img)
% isUpperLeftCorner = 0;
% [imgY, imgX] = size(img);
% 
% for iY = 1:imgY
%     for iX = 1:imgX
%         if img(iY, iX) >= 0.5
%             disp(['Левый верхний угол прямоугольника: (', num2str(iY), ', ', num2str(iX), ')'])
%             isUpperLeftCorner = 1;
%             break;
%         end
%         
%         if isUpperLeftCorner == 1
%             break;
%         end
%     end
% end
% end


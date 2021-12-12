clc;
close all;
clear all;

% загрузка матрицы изображения
img = load('resources/A5_01_1.mat', '-ascii');

% получение размеров изображения
[imgY, imgX] = size(img);

% вывод координаты левого верхнего угла прямоугольника на изображении
printRectUpperLeftCornerCoords(img)

imgAS = fftshift(fft2(img));   % вычисление АС изображения
imgFS = angle(imgAS);             % вычисление ФС изображения
imgASL = log(1 + 10*abs(imgAS));  % логарифмическое преобразование АС
imgAS2 = abs(imgAS);

% вывод изображений
figure(); imshow(img);                      title('Исходное изображение');
figure(); imshow(imgAS2, []);              title('АС исходного изображения');
figure(); imshow(imgASL, []);                  title('АС после логарифмического преобразования');
figure(); imshow(imgFS,[]); colormap(gray);    title('ФС исходного изображения');

% сохранение изображений
imwrite(img, 'results/lab05_opt01_task01_imgOrigin.jpg');
imwrite(imgAS2/max(imgAS2(:)), 'results/lab05_opt01_task01_imgOriginAS.jpg');
imwrite(imgASL/max(imgASL(:)), 'results/lab05_opt01_task01_imgOriginASL.jpg');
imwrite(imgFS/max(imgFS(:)), 'results/lab05_opt01_task01_imgOriginFS.jpg');

%HB = zeros(imgY, imgX);

% значения сдвига
xShift = 100; % вправо на 100 пикселей
yShift = 100; % вниз на 100 пикселей

% инициализация матрицы сдвинутого изобажения
[xF, yF] = meshgrid(1:200, 1:200);

imgShiftedAS = imgAS.*exp(-1i*2*pi.*(xF*xShift + yF*yShift)/200);   % сдвиг спектра в частотой области => АС изображения после сдвига
imgShiftedFS = angle(imgShiftedAS);                                 % вычисление ФС после сдвига
imgShiftedASL = log(1 + 10*abs(imgShiftedAS));                      % логариф. преобразование АС изображения после сдвига
imgShifted = abs(ifft2(ifftshift(imgShiftedAS)));                   % получение изображения после сдвига
imgShiftedAS = abs(imgShiftedAS);

% вывод координаты левого верхнего угла прямоугольника на изображении после сдвига
printRectUpperLeftCornerCoords(imgShifted)

% вывод изображений
figure(); imshow(imgShifted, []);                   title('Изображение после сдвига на 100 пикселей вправо и вниз');
figure(); imshow(imgShiftedAS, []);                 title('АС изображения после сдвига');
figure(); imshow(imgShiftedASL, []);                title('АС с логариф. преобразованием изображения после сдвига');
figure(); imshow(imgShiftedFS, []); colormap(gray); title('ФС изображения после сдвига');

% сохранение изображений
imwrite(imgShifted, 'results/lab05_opt01_task01_imgShifted.jpg');
imwrite(imgShiftedAS/max(imgShiftedAS(:)), 'results/lab05_opt01_task01_imgShiftedAS.jpg');
imwrite(imgShiftedASL/max(imgShiftedASL(:)), 'results/lab05_opt01_task01_imgShiftedASL.jpg');
imwrite(imgShiftedFS/max(imgShiftedFS(:)), 'results/lab05_opt01_task01_imgShiftedFS.jpg');

% функция нахождения координаты левого верхнего угла прямоугольника и выводе на экран
function printRectUpperLeftCornerCoords(img)
isUpperLeftCorner = 0;
[imgY, imgX] = size(img);

for iY = 1:imgY
    for iX = 1:imgX
        if img(iY, iX) >= 0.5
            disp(['Левый верхний угол прямоугольника: (', num2str(iY), ', ', num2str(iX), ')'])
            isUpperLeftCorner = 1;
            break;
        end
        
        if isUpperLeftCorner == 1
            break;
        end
    end
end
end


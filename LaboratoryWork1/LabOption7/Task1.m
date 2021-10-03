% ОРИГИАЛЬНОЕ ИЗОБРАЖЕНИЕ
img = imread('resources/Pic_22_1.bmp');               % чтение картинки
imshow(img); title('Original Image'); pause;          % вывод картики с заголовком

% ПРЯМОУГОЛЬНАЯ СЕТКА =====================================================
% информация о размерах изображения и цветовом канале
[rows, columns, numberOfColorChannels] = size(img); 
hold on;
stepSize = 100;                                       % размер сетки
lineWidth = 1;                                        % толщина линий
lineColor = [0 0 0];                                  % цвет линий

% рисуем горизонтальные линии
for row = 1 : stepSize : rows
    img = insertShape(img, 'Line', [1 row columns row], 'LineWidth', lineWidth, 'Color', lineColor);
end

% рисуем вертикальные линии
for col = 1 : stepSize : columns
    img = insertShape(img, 'Line', [col 1 col rows], 'LineWidth', lineWidth, 'Color', lineColor);
end

imwrite(img,'pic_22_1_1.bmp','bmp');                  % записываем картинку в файл .bmp
imshow(img); title('Original Image + Grid'); pause;   % выводим текущее изображение и делаем паузу


% ПОЛУПРОЗРАЧНЫЙ КРУГ =====================================================
circleCenterX = 800;            
circleCenterY = 500;
circleRadius = 150;
circleColor = [255 127 0];
circleOpacity = 0.5;

% рисуем на картинке полупрозрачный круг
img = insertShape(img,'FilledCircle', [circleCenterX circleCenterY circleRadius],...
                      'Color', circleColor, 'Opacity', circleOpacity);

imwrite(img,'pic_22_1_2.bmp','bmp');
imshow(img); title('Original Image + Grid + Circle'); pause;


% ПОЛУПРОЗРАЧНЫЙ КВАДРАТ ==================================================
squareX = 250;
squareY = 250;
squareSide = 200;
squareColor = [255 0 0];
squareOpacity = 0.5;

% рисуем на картинке полупрозрачным квадрат
img = insertShape(img,'FilledRectangle', [squareX squareY squareSide squareSide],...
                      'Color', squareColor, 'Opacity', squareOpacity);
                  
imwrite(img,'pic_22_1_3.bmp', 'bmp');
imshow(img); title('Original Image + Grid + Circle + Square');

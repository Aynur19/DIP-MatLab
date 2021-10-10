% СЕРЫЙ ПРЯМОУГОЛЬНИК =====================================================
squareSize = 400;
img = zeros(squareSize, squareSize, 3, 'uint8');
img = img + 128;

imwrite(img,'pic_1_1_1.jpg','jpg');
imshow(img); title('Square'); pause;


% ПУРПУРНЫЙ КРУГ ==========================================================
circleCenterX = squareSize/2;            
circleCenterY = squareSize/2;
circleRadius = 40;
circleColor = [196 0 171];
circleOpacity = 1.0;

% вставляем круг
img = insertShape(img,'FilledCircle', [circleCenterX circleCenterY circleRadius],...
                      'Color', circleColor, 'Opacity', circleOpacity);

imwrite(img,'pic_1_1_2.jpg','jpg');
imshow(img); title('Square + Circle'); pause;


% ЖЕЛТЫЙ КВАДРАТ ==========================================================
square2_Side = 50;
square2_Center = [100 100];
square2_Color = [255 255 0];
square2_Opacity = 1.0;

% вставляем квадрат
img = insertShape(img,'FilledRectangle', [square2_Center(1) square2_Center(2) square2_Side square2_Side],...
    'Color', square2_Color, 'Opacity', square2_Opacity);

imwrite(img,'pic_1_1_3.jpg','jpg');
imshow(img); title('Square + Circle + Square'); pause;


% ЗЕЛЕНЫЙ РАВНОСТОРОННИЙ ТРЕУГОЛЬНИК ======================================
triangle_Center = [300 100];
triangle_Side = 50;
triangle_Height = sqrt(3)*triangle_Side/2;
triangle_Color = [0 255 0];
triangle_Opacity = 1.0;

triangleTop = [triangle_Center(1) (triangle_Center(2) - triangle_Height/2)];
triangleLeft = [(triangle_Center(1) - triangle_Side/2) (triangle_Center(2) + triangle_Height/2)];
triangleRight = [(triangle_Center(1) + triangle_Side/2) (triangle_Center(2) + triangle_Height/2)];

% вставляем треугольник
img = insertShape(img,'FilledPolygon', [triangleTop(1) triangleTop(2) triangleLeft(1) triangleLeft(2) triangleRight(1) triangleRight(2)],...
    'Color', triangle_Color, 'Opacity', triangle_Opacity);

imwrite(img,'pic_1_1_4.jpg','jpg');
imshow(img); title('Square + Circle + Square + Triangle'); pause;




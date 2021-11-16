% GRAY RECTANGLE
squareSize = 400;
img = zeros(squareSize, squareSize, 3, 'uint8');
img = img + 128;

imshow(img); title('Gray Square'); pause;
imwrite(img, 'results/lab01_opt01_task01_01.jpg');


% PURPLE CIRCLE
circleCenterX = squareSize/2;            
circleCenterY = squareSize/2;
circleRadius = 40;
circleColor = [196 0 171];
circleOpacity = 1.0;

img = insertShape(img, 'FilledCircle', [circleCenterX circleCenterY circleRadius],...
                      'Color', circleColor, 'Opacity', circleOpacity);

imshow(img); title('Square + Circle'); pause;
imwrite(img, 'results/lab01_opt01_task01_02.jpg');


% YELLOW SQUARE
square2_Side = 50;
square2_Center = [100 100];
square2_Color = [255 255 0];
square2_Opacity = 1.0;

img = insertShape(img,'FilledRectangle', [square2_Center(1) square2_Center(2) square2_Side square2_Side],...
    'Color', square2_Color, 'Opacity', square2_Opacity);

imshow(img); title('Square + Circle + Square'); pause;
imwrite(img, 'results/lab01_opt01_task01_03.jpg');


% GREEN EQUAL-SIDED TRIANGLE
triangle_Center = [300 100];
triangle_Side = 50;
triangle_Height = sqrt(3)*triangle_Side/2;
triangle_Color = [0 255 0];
triangle_Opacity = 1.0;

triangleTop = [triangle_Center(1) (triangle_Center(2) - triangle_Height/2)];
triangleLeft = [(triangle_Center(1) - triangle_Side/2) (triangle_Center(2) + triangle_Height/2)];
triangleRight = [(triangle_Center(1) + triangle_Side/2) (triangle_Center(2) + triangle_Height/2)];

img = insertShape(img, 'FilledPolygon', ...
    [triangleTop(1) triangleTop(2) triangleLeft(1) triangleLeft(2) triangleRight(1) triangleRight(2)], ...
    'Color', triangle_Color, 'Opacity', triangle_Opacity);

imshow(img); title('Square + Circle + Square + Triangle'); pause;
imwrite(img, 'results/lab01_opt01_task01_04.jpg');

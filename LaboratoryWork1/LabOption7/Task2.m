% ОРИГИАЛЬНОЕ ИЗОБРАЖЕНИЕ
img = imread('resources/Pic_22_2.jpg');               % чтение картинки
imshow(img); title('Original Image'); pause;          % вывод картики с заголовком


% ПОЛУТОНОВОЕ ИЗОБРАЖЕНИЕ =================================================
imgGray = rgb2gray(img);

imwrite(imgGray,'pic_22_2_1.jpg','jpg');  
imshow(imgGray); title('Grayscale Image'); pause;         


% НЕГАТИВНОЕ ИЗОБРАЖЕНИЕ ==================================================
imgNeg = 255 - img;

imwrite(imgNeg,'pic_22_2_2.jpg','jpg');  
imshow(imgNeg); title('Negative Image'); pause;


% ПОЛУТОНОВОЕ ИЗОБРАЖЕНИЕ С ЗАДАННЫМ ЧИСЛОМ ГРАДАЦИЙ СЕРОГО ===============
grayscaleCount = 10;
imgGrayGradationsN = round(rgb2gray(img)/(255/10))*(255/10);

imwrite(imgGrayGradationsN,'pic_22_2_3.jpg','jpg');  
imshow(imgGrayGradationsN); title('Grayscale N Graddations Image'); pause;


% ПЕРЕВОД ПОЛУТОНОВОГО ИЗОБРАЖЕНИЯ В ПАЛИТРОВОЕ ИЗОБРАЖЕНИЕ ===============
palette = winter(255);
imgPalette = rgb2gray(img);

imwrite(imgPalette, palette, 'pic_22_2_4.jpg','jpg');
imshow(imgPalette, palette);  title('Winter Palette Image'); pause;
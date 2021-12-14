clc;
clear all;
close all;


%% 1. Считывание изображения
img = imread('resources/A5_01_3.jpg');
imgGray = rgb2gray(img);                            % перевод в полутоновой вид
[sizeY, sizeX] = size(imgGray);                     % определение размера изображения
figure(); imshow(img); title('Исходное изображение');
figure(); imshow(imgGray, []);  title('Полутоновое изображение');
imwrite(imgGray, 'results/lab05_opt01_task03_imgGray.jpg');


%% 2. Вычисление центрированного амплитудного спектра
imgAS = fft2(imgGray);              % амплитудный спектр изображения
imgCAS = fftshift(imgAS);           % центрирование АС изображения
imgCASL = log(imgCAS*2e-5+1);       % логарифмическое преобразование центрированного АС изображения       
figure(); imshow(abs(imgCASL), []); title('Центрированный АС изображения с логарифмическим преобразованием');
imwrite(abs(imgCASL)/max(abs(imgCASL(:))), 'results/lab05_opt01_task03_imgCAS.jpg');


%% 3. Построение БФНЧ (Фильтр низких частот Баттерворта)
centerY = floor(sizeY/2);                                       % центр изображения по Y
centerX = floor(sizeX/2);                                       % центр изображения по X
[YY, XX] = meshgrid(-centerX:centerX-1, -centerY:centerY-1);    % сетка размером с изображение и с центром [0, 0]
D0 = 30;                            % частота среза
n = 2;                              % порядок фильтра Баттерворта

% построение фильтра БФНЧ
D = sqrt(YY.^2 + XX.^2);
FC = 1./(1+(sqrt(2) - 1)*((D./D0).^(2*n)));     % частотная характеристика фильтра БФНЧ
ASF = imgCAS.*FC;                               % амплитудный спектр фильтра БФНЧ


%% 4. Получение расфокусированного изображения
imgBlured = real(ifft2(ifftshift(ASF)));
imgBlured = imgBlured/(max(imgBlured(:)));
figure(); imshow(imgBlured); title('Расфокусированное (размытое) изображение');
imwrite(imgBlured/max(imgBlured(:)), 'results/lab05_opt01_task03_imgBlured.jpg');


%% 5. Построение фильтра Лапласа
FCL = -((YY-round(sizeY/2)).^2) + ((XX-round(sizeX/2)).^2); % частотная характеристика фильтра Лапласа
SFL = ASF.*FCL;                                             % АС фильтра Лапласа



%% 6. Фильтрация изображения
imgFiltered=real(ifft2(ifftshift(SFL)));                    
imgFiltered=imgFiltered/max(max(imgFiltered));
imgFiltered=double(imgGray)-imgFiltered;
figure(); imshow(imgFiltered, []); title('Результат повышения резкости с помощью фильтра Лапласа');
imwrite(imgFiltered/max(imgFiltered(:)), 'results/lab05_opt01_task03_imgFilteredL.jpg');


%% 7. Построение фильтра ГФВЧ (Гауссовский фильтр высоких частот)
mi2 = round(sizeY/2);
ni2 = round(sizeX/2);
HG = zeros(sizeY,sizeX);        % инициализация передаточной ф-ии фильтра
d0 = 200;                       % частота среза
for im = 1:sizeY
    for in = 1:sizeX
        dt = (in-ni2)^2 + (im-mi2)^2;
        HG(im,in) = exp(-dt/(2*d0*d0)); % заполнение передаточной функции
    end
end

HG = HG/max(HG(:));
HG = ones(sizeY,sizeX) - HG;
figure(); imshow(HG, []); title('ГФВЧ (Гауссовский фильтр высоких частот)');
imwrite(HG/max(HG(:)), 'results/lab05_opt01_task03_FilterG.jpg');


%% 8. Выделение контуров с помощью ГФВЧ
G1 = abs(ifft2(imgCAS.*HG));     % отфильтрованное изображение
figure(); imshow(G1, []); title('Изображение с выделенными контурами');
imwrite(G1/max(G1(:)), 'results/lab05_opt01_task03_imgFilteredG.jpg');

G1 = ones(sizeY,sizeX) - G1;
figure(); imshow(G1, []); title('Инвертированное изображение с выделенными контурами');
G1 = rescale(G1);
imwrite(G1, 'results/lab05_opt01_task03_imgInvertFilteredG.jpg');

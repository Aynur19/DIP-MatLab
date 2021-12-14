clc;
clear all;
close all;


%% 1. Считывание изображения
img = im2double(imread('resources/A5_01_3.jpg'));
imgGray = rgb2gray(img);                            % перевод в полутоновой вид
imgGray = im2double(imgGray);                       % перевод в действительный тип
[mi, ni] = size(imgGray);               % определение размера изображения
% CH = F_chess_2D(mi, ni);                % форм. матрицы центрирования

figure(); imshow(img); title('Исходное изображение');
figure(); imshow(imgGray, []);  title('Полутоновое изображение');


%% 2. Вычисление центрированного амплитудного спектра
imgAS = fftshift(fft2(imgGray));
imgASL = log(imgAS*2e-5+1);
figure(); imshow(abs(imgASL), []); title('Центрированный АС изображение');


centerX = floor(




%% 3. Формирование БФНЧ (Фильтр низких частот Баттерворта)
mi2 = round(mi/2);
ni2 = round(ni/2);
HB = zeros(mi, ni); % инициализация передаточной ф-ии фильтра
d0 = 30;                        % частота среза

for im = 1:mi
    for in = 1:ni
        dt = sqrt((in-ni2)^2+(im-mi2)^2);
        HB(im, in) = 1/((1+(dt/d0))^(2*2));
    end
end

% HB = HB/max(HB(:));
% HB = ones(imgSizeY, imgSizeX) - HB;
figure(); imshow(HB, []); title('Фильтр низких частот Баттерворта');     


%% 4. Расфокусировка изображения
I1 = imgGray.*CH; % центрирование спектра
FI1 = fft2(I1);
figure(); imshow(log(1+1*abs(FI1)), []); title('Центрированный АС изображение');

imgBlure = real(ifft2(FI1.*HB)); % отфильтрованное изображение
imgBlure = imgBlure.*CH; % восстановление координат
figure(41); imshow(imgBlure,[]); title('Расфокусированное изображение с помощью фильтра Баттерворта (n=2, D0=30)');


%% 5. Построение фильтра Лапласиана
[mb,nb] = size(imgBlure);
CH = F_chess_2D(mb,nb); % функция центрирования спектра
%% 2. Формирование ЧХ фильтра Лапласа
HL = zeros(mb,nb);
mb2 = round(mb/2);
nb2 = round(nb/2);
for im = 1:mb
 for in = 1:nb
 HL(im,in) = -((im-mb2)^2 + (in-nb2)^2);
 end
end
HLc = HL.*CH;
FHL = real(ifft2(HLc));

figure(); imshow(abs(ifft2(HLc))); title('123');

%% 3. Лапласиан-фильтрация в частотной области
B1 = imgBlure.*CH; % центрирование спектра
FB = fft2(B1);
% 
% filter1=[0 -1 0; -1 4 -1; 0 -1 0];
% filter2=[0 1 0; 1 -4 1; 0 1 0];
% filter3=[1 1 1; 1 -8 1; 1 1 1];
% filter4=[-1 -1 -1; -1 8 -1; -1 -1 -1];
% outImage = zeros(nb, mb);
% filtered_3x3 = imfilter(imgBlure, filter2, 'replicate');
% outImg = im2uint8(filtered_3x3);
% figure(); imshow(outImg); title('3210');

G1 = real(ifft2(ifftshift(FB.*HL))); % отфильтрованное изображение
%f G1 = G1.*CH; % восстановление координат
% G1 = G1+G1+G1;
figure(); imshow(G1,[]);
imgBlure = imgBlure/max(max(imgBlure(:))); % приведение к диапазону [-1 1]
% G1 = G1/abs(max(G1(:))); % приведение к диапазону [-1 1]
BL = imgBlure - G1; % вычитание Лапласиана из оригин.
% BL = BL - G1;
%BL = imadjust(BL,[],[],0.25);
% BL = histeq(BL); % улучшение гистограммы
% BL = log(1+1*BL);
figure(); imshow(BL,[]);
figure(); imshow(1-BL,[]);
% LAPLACIAN MASKS
% W1 = [1 1 1; 1 -8 1; 1 1 1]; 
% W2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
% W3 = [0 1 0; 1 -4 1; 0 1 0];
% W4 = [0 -1 0; -1 4 -1; 0 -1 0];
% 
% imgBlure256 = uint8(round(255 * imgBlure)); % перевод в формат uint8
% sigma = 0.2; % параметр функ. locallapfilt [0, 1]
% alpha = 0.4; % параметр функ. locallapfilt [0.1, 10]
% beta = 1.5; % параметр функ. locallapfilt [0, 5]
% 
% C = locallapfilt(imgBlure256, sigma, alpha, beta);
% 
% 
% W = [ 0 1 0; 1 -4 1; 0 1 0];                 % фильтр Лапласиана
% %W = [ 1 1 1; 1 -8 1; 1 1 1];% фильтр Лапласиана
% G = imfilter(imgBlure,W,'replicate'); % фильтрация
% % G = imfilter(G,W,'replicate'); % фильтрация
% % G = imfilter(G,W,'replicate'); % фильтрация
% GL = imgBlure-G; % увеличение резкости
% GL = histeq(GL); % эквализация гистограммы
% figure(); imshow(GL,[]);
% 
% outputimage = zeros(mi,ni);
% 
% G1 = imfilter(imgBlure, W1, 'replicate');
% GL1 = histeq(imgBlure - G1);
% outputimage = im2uint8(G1); 
% figure();imshow(outputimage); title('replicate');
% 
% G2 = imfilter(imgBlure, W2, 'replicate');
% GL2 = histeq(imgBlure - G2);
% outputimage = im2uint8(G2); 
% figure();imshow(outputimage); title('replicate2');
% 
% G3 = imfilter(imgBlure, W3, 'replicate');
% GL3 = histeq(imgBlure - G3);
% outputimage = im2uint8(G1); 
% figure();imshow(outputimage); title('replicate3');
% 
% G4 = imfilter(imgBlure, W4, 'replicate');
% GL4 = histeq(imgBlure - G4);
% outputimage = im2uint8(G4); 
% figure();imshow(outputimage); title('replicate4');
% figure(1); tiledlayout(2, 4, 'TileSpacing', 'tight');
% nexttile; imshow(img); title('Исходное изображение');
% nexttile; imshow(imgGray); title('Исходное полутоновое изображение');
% nexttile; imshow(imgBlure); title('Полутоновое изображение, размытое гауссовским фильтром');
% nexttile; imshow(GL1); title('Лапласиан [1 1 1; 1 -8 1; 1 1 1]');
% nexttile; imshow(GL2); title('Лапласиан [-1 -1 -1; -1 8 -1; -1 -1 -1]');
% nexttile; imshow(GL3); title('Лапласиан [0 1 0; 1 -4 1; 0 1 0]');
% nexttile; imshow(GL4); title('Лапласиан [0 -1 0; -1 4 -1; 0 -1 0]');
% nexttile; imshow(C); title('Лапласиан locallapfilt');


% HL = zeros(mi, ni);
% for im = 1:mi
%     for in = 1:ni
%         HL(im,in) = -((im-mi2)^2 + (in-ni2)^2);
%     end
% end
% HLc = HL.*CH;
% FHL = real(ifft2(HLc));
% % FHL = FHL/max(FHL(:));
% figure(); imshow(abs(fft2(HLc))); title('Частотная характеристика фильтра Лапласиана');


%% 3. Лапласиан-фильтрация в частотной области
% B1 = G1.*CH; % центрирование спектра
% FB = fft2(B1);
% G2 = real(ifft2(FB.*HL)); % отфильтрованное изображение
% G2 = G2.*CH; % восстановление координат
% figure(30); imshow(G2,[]); title('1');
% 
% B = G1/abs(max(G1(:))); % приведение к диапазону [-1 1]
% G3 = G2/abs(max(G2(:))); % приведение к диапазону [-1 1]
% BL = B - G3; % вычитание Лапласиана из оригин.
% BL = histeq(BL); % улучшение гистограммы
% figure(32); imshow(BL,[]); title('2');


%% Программа формирования шахматной матрицы (-1)^(x+y)
% для центрирования изображений в частотной области
function CH = F_chess_2D(m,n) 
CH = zeros(m,n);
for im = 1:m
    for in = 1:n
        CH(im,in) = (-1)^(in+im);
    end
end
end
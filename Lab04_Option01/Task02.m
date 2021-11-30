clc;
close all;
clear all;

[YW, fs] = audioread('resources/Audio4_01_2.wav'); 
% sound(YW, Fs); 


dt = 1/fs;          % Временной шаг дискретизации
ts = length(YW)*dt; % Длительность сигналов
T = 0:dt:ts-dt;    % массив времени

nT = length(T);
dF = fs/nT;

figure(); plot(T, YW); title('Аудио-сигнал с наложенными помехами'); %pause();


% СПЕКТР СИГНАЛА
SF = fft(YW);                % Спектр сигнала
FX = 0:dF:dF*(nT-1);        % Массив отсчетов частоты
nf2 = round(length(FX)/2); 
figure(); plot(FX(1:nf2), abs(SF(1:nf2))); title('Спектр аудиосигнала'); 


% ЧАСТОТНЫЕ ОБЛАСТИ
% 1. 60 Гц
% 2. 120 Гц
% 3. 180 Гц


% РЕЖЕКТОРНЫЙ ФИЛЬТР
d21 = 0.1; % МАКСИМАЛЬНО ДОПУСТИМОЕ ОТКЛОНЕНИЕ В ПЗ1
d1 = 0.1; % МАКСИМАЛЬНО ДОПУСТИМОЕ ОТКЛОНЕНИЕ В ПП
d22 = 0.1; % МАКСИМАЛЬНО ДОПУСТИМОЕ ОТКЛОНЕНИЕ В ПЗ2

m = [1 0 1];                % ВЕКТОР ЗНАЧЕНИЙ АЧХ
f1 = [57, 58, 62, 63];   % ВЕКТОР ГРАНИЧНЫХ ЧАСТОТ
f2 = [117, 118, 122, 123];   % ВЕКТОР ГРАНИЧНЫХ ЧАСТОТ
f3 = [177, 178, 182, 183];   % ВЕКТОР ГРАНИЧНЫХ ЧАСТОТ
ripple = [d21, d1, d22];    % ВЕКТОР МАКСИМАЛЬНО ДОПУСТИМЫХ ОТКЛОНЕНИЙ

[R1,wc1,beta1,ftype1] = kaiserord(f1,m,ripple,fs);   % ПАР.ОКНА КАЙЗЕРА
[R2,wc2,beta2,ftype2] = kaiserord(f2,m,ripple,fs);
[R3,wc3,beta3,ftype3] = kaiserord(f3,m,ripple,fs);

B1 = fir1(R1, wc1, ftype1, kaiser(R1+1, beta1), 'noscale'); % КОЭФФ.ФИЛЬТРА
B2 = fir1(R2, wc2, ftype2, kaiser(R2+1, beta2), 'noscale');
B3 = fir1(R3, wc3, ftype3, kaiser(R3+1, beta3), 'noscale');


nb = length(B1);
nb2 = round(nb/2);
nb4 = round(nb2/4);
WB = (kaiser(nb,2.0))';         % ВЕСОВОЕ ОКНО КАЙЗЕРА

B = conv(conv(B1.*WB, B2.*WB), B3.*WB);% ВЕСОВАЯ ОБРАБОТКА ИХ ФИЛЬТРА
nb = length(B);

% ИМПУЛЬСНАЯ ХАРАКТЕРИСТИКА ФИЛЬТРА
fsnb = fs/nb;                   % ШАГ ИЗМЕНЕНИЯ ЧАСТОТЫ СПЕКТРА
FH = 0:fsnb:fsnb*(nb-1);        % СЕТКА ЧАСТОТ ДЛЯ СПЕКТРА
figure(); plot(B); title('Импульная характеристика фильтра');

% ЧАСТОТНАЯ ХАРАКТЕРИСТИКА ФИЛЬТРА
HB = [B, zeros(1, nT-nb)];
HB = fft(HB);                   % ВЫЧИСЛЕНИЕ ЧАСТОТНОЙ ХАР-КИ
HB = HB.*HB;
HB = HB.*HB;

figure(); plot(FH(1:nb4), abs(HB(1:nb4))); title('Частотная харакетристика фильтра'); 


% ФИЛЬТРАЦИЯ В ЧАСТОТНОЙ ОБЛАСТИ
outSF = real(ifft(SF'.*HB));
figure(); plot(T, outSF); title('Фильтрация в частотной области');

% sound(outSF, fs);
audiowrite('results/frequencyDomainFintering.wav', outSF, fs);


outSF_S = abs(fft(outSF));
figure(); plot(T, outSF_S); title('Спектр сигнала после фильтрации в частотной области');
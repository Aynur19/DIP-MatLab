clc; 
clear all;
close all;

% ПАРАМЕТРЫ СИГНАЛОВ
f1 = 1e2; % частоты
f2 = 1e3;
f3 = 1e4;

ts = 1;         % Длительность сигналов
fs = 8*f3;      % Частота дискретизации
dt = 1/fs;      % Шаг дискретизации
T = 0:dt:ts;    % массив времени

nT = length(T);
dF = fs/nT;


% СИГНАЛЫ
S1 = sin(2*pi*f1.*T); 
S2 = sin(2*pi*f2.*T); 
S3 = sin(2*pi*f3.*T);
S = S1 + S2 + S3;
figure(); plot(T, S); title('Смесь 3-х сигналов'); %pause();


% СПЕКТР СИГНАЛА
SF = fft(S);                % Спектр сигнала
FX = 0:dF:dF*(nT-1);        % Массив отсчетов частоты
nf2 = round(length(FX)/2); 
figure(); plot(FX(1:nf2), abs(SF(1:nf2))); title('Спектр смеси 3-х сигналов'); %pause();


% ФИЛЬТР ВЫДЕЛЯЮЩИЙ ТОЛЬКО СИГНАЛ С ЧАСТОТОЙ 100 Гц
m = [1 0];                  % ВЕКТОР ЗНАЧЕНИЙ АЧХ
f = [200 210];              % ВЕКТОР ГРАНИЧНЫХ ЧАСТОТ
ripple = [0.1 0.1];         % ВЕКТОР МАКСИМАЛЬНО ДОПУСТИМЫХ ОТКЛОНЕНИЙ

[R,wc,beta,ftype] = kaiserord(f,m,ripple,fs);   % ПАР.ОКНА КАЙЗЕРА
disp(['R = ' num2str(R)])                       % ОЦЕНКА ПОРЯДКА КИХ-ФИЛЬТРА
disp(['wc = ' num2str(wc)])                     % НОРМИРОВАННАЯ ЧАСТОТА РАЗРЫВА
disp(['beta = ' num2str(beta)])                 % ПАРАМЕТР ОКНА КАЙЗЕРА
disp(['ftype = ' char(ftype)])                  % ТИП КИХ-ФИЛЬТРА

B = fir1(R, wc, ftype, kaiser(R+1, beta), 'noscale'); % КОЭФФ.ФИЛЬТРА
nb = length(B);
nb2 = round(nb/2);
nb4 = round(nb2/4);
WB = (kaiser(nb,4.0))';         % ВЕСОВОЕ ОКНО КАЙЗЕРА
B = B.*WB;                    % ВЕСОВАЯ ОБРАБОТКА ИХ ФИЛЬТРА


% ИМПУЛЬСНАЯ ХАРАКТЕРИСТИКА ФИЛЬТРА
fsnb = fs/nb;                   % ШАГ ИЗМЕНЕНИЯ ЧАСТОТЫ СПЕКТРА
FH = 0:fsnb:fsnb*(nb-1);        % СЕТКА ЧАСТОТ ДЛЯ СПЕКТРА
figure(); plot(B); title('Импульная характеристика фильтра');


% ЧАСТОТНАЯ ХАРАКТЕРИСТИКА ФИЛЬТРА
HB = [B, zeros(1, nT-nb)];
HB = fft(HB);                   % ВЫЧИСЛЕНИЕ ЧАСТОТНОЙ ХАР-КИ
figure(); plot(FH(1:nb4), abs(HB(1:nb4))); title('Частотная харакетристика фильтра'); 


% ФИЛЬТРАЦИЯ ВО ВРЕМЕННОЙ ОБЛАСТИ
outST = conv(B, S);
figure(); plot(T(nb:nT),outST(nb:nT)); title('Фильтрация во временной области'); 


% ФИЛЬТРАЦИЯ В ЧАСТОТНОЙ ОБЛАСТИ
outSF = real(ifft(SF.*HB));
figure(); plot(T, outSF); title('Фильтрация в частотной области');


% СПЕКТР СИГНАЛА ПОСЛЕ ФИЛЬТРАЦИИ ВО ВРЕМЕННОЙ ОБЛАСТИ
spectrumOutST = abs(fft(outST));
figure(); plot(spectrumOutST); title('Спектр сигнала после фильтрация во временной области'); 


% СПЕКТР СИГНАЛА ПОСЛЕ ФИЛЬТРАЦИИ В ЧАСТОТНОЙ ОБЛАСТИ
spectrumOutSF = abs(fft(outSF));
figure(); plot(spectrumOutSF); title('Спектр сигнала после фильтрация во временной области'); 

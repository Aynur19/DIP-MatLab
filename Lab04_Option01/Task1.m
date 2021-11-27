clc; 
clear all;
close all;

% Частоты сигналов;
f1 = 1e2;
f2 = 1e3;
f3 = 1e4;


ts = 1;         % Длительность сигналов
fs = 8*f3;      % Частота дискретизации
dt = 1/fs;      % Шаг дискретизации
T = 0:dt:ts;    % массив времени

nT = length(T);
dF = fs/nT;

% Сигналы
S1 = sin(2*pi*f1.*T); 
S2 = sin(2*pi*f2.*T); 
S3 = sin(2*pi*f3.*T);
S = S1 + S2 + S3;

figure(1); plot(T, S1); title('Сингнал с частотой 100 Гц'); pause();
figure(5); plot(T, S2); title('Сингнал с частотой 1000 Гц');  pause();
figure(10); plot(T, S3); title('Сингнал с частотой 10000 Гц'); pause();
figure(15); plot(T, S); title('Смесь 3-х сигналов'); pause();


SF = fft(S);                % Спектр сигнала
FX = 0:dF:dF*(nT-1);        % Массив отсчетов частоты
nf2 = round(length(FX)/2); 
figure(20); plot(FX(1:nf2), abs(SF(1:nf2))); title('Спектр смеси сигналов');  pause();

m = [1 0];                  % ВЕКТОР ЗНАЧЕНИЙ АЧХ
f = [200 210];              % ВЕКТОР ГРАНИЧНЫХ ЧАСТОТ
ripple = [0.1 0.1];         % ВЕКТОР МАКСИМАЛЬНО ДОПУСТИМЫХ ОТКЛОНЕНИЙ

[R,wc,beta,ftype] = kaiserord(f,m,ripple,fs);   % ПАР.ОКНА КАЙЗЕРА
disp(['R = ' num2str(R)])                       % ОЦЕНКА ПОРЯДКА КИХ-ФИЛЬТРА
disp(['wc = ' num2str(wc)])                     % НОРМИРОВАННАЯ ЧАСТОТА РАЗРЫВА
disp(['beta = ' num2str(beta)])                 % ПАРАМЕТР ОКНА КАЙЗЕРА
disp(['ftype = ' char(ftype)])                  % ТИП КИХ-ФИЛЬТРА


B1 = fir1(R,wc,ftype,kaiser(R+1,beta),'noscale');% КОЭФФ.ФИЛЬТРА
nb = length(B1);
nb2 = round(nb/2);
WB = (kaiser(nb,4.0))';         % ВЕСОВОЕ ОКНО КАЙЗЕРА

B2 = B1.*WB;                    % ВЕСОВАЯ ОБРАБОТКА ИХ ФИЛЬТРА
fsnb = fs/nb;                   % ШАГ ИЗМЕНЕНИЯ ЧАСТОТЫ СПЕКТРА
FH = 0:fsnb:fsnb*(nb-1);        % СЕТКА ЧАСТОТ ДЛЯ СПЕКТРА
figure(25); plot(B2); title("Импульсная характеристика"); grid on; pause();  % ПОСТРОЕНИЕ ИХ

HB = fft(B2);                   % ВЫЧИСЛЕНИЕ ЧАСТОТНОЙ ХАР-КИ

figure(20); plot(FH(1:nb2),abs(HB(1:nb2))); title("Частотная характеристика"); pause(); 
% HB = [HB zeros(1,nT-nBi)];
% S_out1 = real(ifft(S.*HB));
% B1 = [B1 zeros(1,nT-nb2)];
nb = length(B2);
S_out = conv(B2, S);
figure(30); plot(T(nb:nT),S_out(nb:nT)); title("Фильтрация во временной области"); pause();
S_out_F = abs(fft(S_out));
figure(35); plot(S_out_F); pause;

nBi = length(HB);
HB = [HB zeros(1 ,nT-nBi)];
S_out1 = real(ifft(S.*HB));
% Hi = sinc(-10:0.01:10); % ИХ типа sinc()
% nHi = length(Hi); % число отсчетов ИХ
% Hi = Hi.*(hamming(nHi))'; % умнож. ИХ на окно Хэмминга
% Hi = [Hi zeros(1,nT-nHi)]; % дополнение нулями
% FH = fft(Hi); % ДПФ для вычисл. ЧХ фильтра
% 
% S_out = conv(Hi, S); % фильтрация путем свертки
figure(50); plot(T(nBi:nT),S_out1(nBi:nT)); grid on;  title("Фильтрация в частотной области"); pause();


clc; 
clear all;
close all;

% f1 = 7e2;
% f2 = 5e3;
% f3 = 3e4;
% 
%  
% ts = 1;
% fs = 100;
% fs2 = 1000;
% fs3 = 100000;
% dt = 1/fs2;
% 
% T = 0:dt:ts;
% nT = length(T);
% dF = fs/nT;
% 
% S1 = 0.1*sin(2*pi/2*f1.*T); 
% S2 = 1.0*sin(2*pi/2*f2.*T); 
% S3 = 1.5*cos(2*pi/2*f3.*T);
% S = S1 + S2 + S3;
% 
% figure(1); plot(T, S1); title('F1');
% figure(2); plot(T, S2); title('F2'); 
% figure(3); plot(T, S3); title('F3');
% figure(4); plot(T, S); title('F');

[S1, nT1, dF1] = getSingal(100, 1, 100, 0.1);
[S2, nT2, dF2] = getSingal(1000, 1, 1000, 0.5);
[S3, nT3, dF3] = getSingal(10000, 1, 10000, 1.5);

function [S, nT, dF] = getSingal(freqS, TS, FS, k)
    dt = 1/FS;

    T = 0:dt:TS;
    nT = length(T);
    dF = FS/nT;

    S = k*sin(2*pi*freqS.*T);
    figure(); plot(T, S); title(sprintf('F = %.2f*sin(2*pi*%.2f)', k, freqS));
end


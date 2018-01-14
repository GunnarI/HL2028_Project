function [hr_fft_f, hr_fft_p] = hrFFT(s, t, Fs)

% L = length(t);
% Y = fft(s, L);
% P2 = abs(Y/L);
% hr_fft_p = P2(1:floor(L/2+1));
% hr_fft_p(2:end-1) = 2*hr_fft_p(2:end-1);
% hr_fft_f = Fs*(0:(L/2))/L;

[hr_fft_p,hr_fft_f] = periodogram(s);

% T = 1/Fs;                     % Sample time
% L = length(s);                    % Length of signal (s)
% t = (0:L-1)*T;                % Time vector
% y = ; %replace with your signal
% NFFT = 2^(ceil(log2(length(s)))); %infimum power of 2 w.r.t length
% NFFT ~= 2048; %closest to 1800 for example
% hr_fft_p = fft(s,NFFT)/L;
% hr_fft_f = Fs/2*linspace(0,1,NFFT/2+1);

end
function [hr_fft_f, hr_fft_p] = hrFFT(s, t, Fs)

L = length(t);
Y = fft(s);
P2 = abs(Y/L);
hr_fft_p = P2(1:floor(L/2+1));
hr_fft_p(2:end-1) = 2*hr_fft_p(2:end-1);
hr_fft_f = Fs*(0:(L/2))/L;
% figure
% plot(hr_fft.*1000,P1) 
% xlim([3.5 400]) 

end
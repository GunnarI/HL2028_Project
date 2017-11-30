
testmode = 1;

% Subject 1 BEFORE biofeedback session
load S1Before;
t_S1B = S1Before(length(S1Before)-60000+1:end,1)-S1Before(length(S1Before)-60000+1,1);
ecg_S1B = S1Before(length(S1Before)-60000+1:end,2);
teb_S1B = S1Before(length(S1Before)-60000+1:end,3);
% Subject 1 AFTER biofeedback session
load S1After;
t_S1A = S1After(:,1);
ecg_S1A = S1After(:,2);
teb_S1A = S1After(:,3);

% Subject 2 BEFORE biofeedback session
load S2Before;
t_S2B = S2Before(:,1);
ecg_S2B = S2Before(:,2);
teb_S2B = S2Before(:,3);
% Subject 2 AFTER biofeedback session
load S2After;
t_S2A = S2After(:,1);
ecg_S2A = S2After(:,2);
teb_S2A = S2After(:,3);

% Subject 3 BEFORE biofeedback session
load S3Before;
t_S3B = S3Before(:,1);
ecg_S3B = S3Before(:,2);
teb_S3B = S3Before(:,3);
% Subject 3 AFTER biofeedback session
load S3After;
t_S3A = S3After(:,1);
ecg_S3A = S3After(:,2);
teb_S3A = S3After(:,3);

% Subject 4 BEFORE biofeedback session
load S4Before;
t_S4B = S4Before(:,1);
ecg_S4B = S4Before(:,2);
teb_S4B = S4Before(:,3);
% Subject 4 AFTER biofeedback session
load S4After;
t_S4A = S4After(:,1);
ecg_S4A = S4After(:,2);
teb_S4A = S4After(:,3);

Fs = 200;
upsamplerate = 256;
n = upsamplerate/Fs;

% Use interpolation (FFT method) to upsample the signal from 200Hz to 256Hz
ecg_S1B_Interp256 = interpft(ecg_S1B-mean(ecg_S1B),length(ecg_S1B)*n);
%ecg_S1B_Interp256 = interpft(rm_baseline_poly(t_S1B,ecg_S1B,20),length(ecg_S1B)*n);

t2 = 1/(n*Fs):1/(n*Fs):length(ecg_S1B_Interp256)/(Fs*n);

% Least Sq. FIR LP & HP filters (cascaded): 70dB 0.05-40Hz 1dB ripple.
ecg_S1B_256filtInterp  = filterECG256Hz(ecg_S1B_Interp256);

figure
plot(t_S1B,ecg_S1B, 'r')
hold on
plot(t2,ecg_S1B_Interp256, 'b')
hold on
plot(t2,ecg_S1B_256filtInterp,'g')
figure
% rrextract returns the time locations of the R waves (assigned to rrs256
% here) and the RS amplitude (the difference R and S wave)
[rrs256, RS] = rrextract(ecg_S1B_256filtInterp,Fs*n,0.2,1);

figure
plot(t2(rrs256(2:end)),movmean(diff(t2(rrs256)),20))
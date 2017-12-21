%% Set run type variables
baselineWanderPlots = 0;

%% Extract and save data and define variables
% Subject 1 BEFORE biofeedback session
load S1Before;
t_S1B = S1Before(:,1);
ecg_S1B = S1Before(:,2);
teb_S1B = S1Before(:,3);
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

%% Detrend signal with polynomial fitting:
fittingOrder = 3;
ecg_S1B_detr = rm_baseline_poly(t_S1B,ecg_S1B,fittingOrder);
ecg_S1A_detr = rm_baseline_poly(t_S1A,ecg_S1A,fittingOrder);
ecg_S2B_detr = rm_baseline_poly(t_S2B,ecg_S2B,fittingOrder);
ecg_S2A_detr = rm_baseline_poly(t_S2A,ecg_S2A,fittingOrder);
ecg_S3B_detr = rm_baseline_poly(t_S3B,ecg_S3B,fittingOrder);
ecg_S3A_detr = rm_baseline_poly(t_S3A,ecg_S3A,fittingOrder);
ecg_S4B_detr = rm_baseline_poly(t_S4B,ecg_S4B,fittingOrder);
ecg_S4A_detr = rm_baseline_poly(t_S4A,ecg_S4A,fittingOrder);

%% Removal of baseline wander using forward-backward IIR filtering and 
%   sampling rate alteration

%% Forward-backward IIR filtering
% Create an instance of a tenth order Butterworth Highpass filter to filter
% out baseline wander using the function "baselineWanderButt"
wanderButt = baselineWanderButt;

% Using the function "filtfilt" the detrended ECG data is filtered with
% forward-backward Butterworth filtering
ecg_S1B_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S1B_detr);
ecg_S1A_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S1A_detr);
ecg_S2B_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S2B_detr);
ecg_S2A_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S2A_detr);
ecg_S3B_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S3B_detr);
ecg_S3A_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S3A_detr);
ecg_S4B_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S4B_detr);
ecg_S4A_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S4A_detr);


%% Sampling Rate Alteration

D = 2;              % The order of downsampling
firOrder = 100;     % The order of the filter used in downsampling
% Create an instance of a 500 order Hamming Window Highpass filter using 
% the function "baselineWanderHamm"
wanderHamm = baselineWanderHamm;

% samplingRateAlt returns the signal after downsampling -> filtering ->
% upsampling
ecg_S1B_rateAlt = samplingRateAlt(ecg_S1B_detr, D, wanderHamm);
ecg_S1A_rateAlt = samplingRateAlt(ecg_S1A_detr, D, wanderHamm);
ecg_S2B_rateAlt = samplingRateAlt(ecg_S2B_detr, D, wanderHamm);
ecg_S2A_rateAlt = samplingRateAlt(ecg_S2A_detr, D, wanderHamm);
ecg_S3B_rateAlt = samplingRateAlt(ecg_S3B_detr, D, wanderHamm);
ecg_S3A_rateAlt = samplingRateAlt(ecg_S3A_detr, D, wanderHamm);
ecg_S4B_rateAlt = samplingRateAlt(ecg_S4B_detr, D, wanderHamm);
ecg_S4A_rateAlt = samplingRateAlt(ecg_S4A_detr, D, wanderHamm);

if (baselineWanderPlots)
    plotBaselineWanderComparison;
end
%% Powerline Interference
%ecg_S1B_prePro1 = removePowerline(ecg_S1B_rateAlt, Fs, 50, 2);
%ecg_S1B_prePro2 = removePowerline(ecg_S1B_rateAlt, Fs, 60, 2);

% plot(ecg_S1B_rateAlt)
% hold on
% plot(ecg_S1B_prePro)
% figure
% plot(ecg_S1B_rateAlt)
% hold on
% plot(ecg_S1B_prePro2)

%% QRS Detection
% pan_tompkins algorithm downloaded from: https://se.mathworks.com/matlabcentral/fileexchange/45840-complete-pan-tompkins-implementation-ecg-qrs-detector
% [qrs_amp_alt,qrs_i_alt,delay_alt]=pan_tompkin(ecg_S1A_rateAlt,Fs);
% [qrs_amp_raw,qrs_i_raw,delay_raw]=pan_tompkin(ecg_S1A,Fs);

%% Pan-Tompkins
ecg_S1B_zeromean = ecg_S1B - mean(ecg_S1B);
ecg_S1A_zeromean = ecg_S1A - mean(ecg_S1A);
ecg_S2B_zeromean = ecg_S2B - mean(ecg_S2B);
ecg_S2A_zeromean = ecg_S2A - mean(ecg_S2A);
ecg_S3B_zeromean = ecg_S3B - mean(ecg_S3B);
ecg_S3A_zeromean = ecg_S3A - mean(ecg_S3A);
ecg_S4B_zeromean = ecg_S4B - mean(ecg_S4B);
ecg_S4A_zeromean = ecg_S4A - mean(ecg_S4A);

% Step 1: Apply bandpass filter to raw signal
ecg_S1B_PT1 = PTBandpass(ecg_S1B_zeromean, Fs);
ecg_S1A_PT1 = PTBandpass(ecg_S1A_zeromean, Fs);
ecg_S2B_PT1 = PTBandpass(ecg_S2B_zeromean, Fs);
ecg_S2A_PT1 = PTBandpass(ecg_S2A_zeromean, Fs);
ecg_S3B_PT1 = PTBandpass(ecg_S3B_zeromean, Fs);
ecg_S3A_PT1 = PTBandpass(ecg_S3A_zeromean, Fs);
ecg_S4B_PT1 = PTBandpass(ecg_S4B_zeromean, Fs);
ecg_S4A_PT1 = PTBandpass(ecg_S4A_zeromean, Fs);
% ecg_S1B_PT1 = PTBandpass(ecg_S1B_rateAlt, Fs);
% ecg_S1A_PT1 = PTBandpass(ecg_S1A_rateAlt, Fs);
% ecg_S2B_PT1 = PTBandpass(ecg_S2B_rateAlt, Fs);
% ecg_S2A_PT1 = PTBandpass(ecg_S2A_rateAlt, Fs);
% ecg_S3B_PT1 = PTBandpass(ecg_S3B_rateAlt, Fs);
% ecg_S3A_PT1 = PTBandpass(ecg_S3A_rateAlt, Fs);
% ecg_S4B_PT1 = PTBandpass(ecg_S4B_rateAlt, Fs);
% ecg_S4A_PT1 = PTBandpass(ecg_S4A_rateAlt, Fs);

% Step 2: Derivative filter
ecg_S1B_PT2 = PTDerivative(ecg_S1B_PT1, Fs);
ecg_S1A_PT2 = PTDerivative(ecg_S1A_PT1, Fs);
ecg_S2B_PT2 = PTDerivative(ecg_S2B_PT1, Fs);
ecg_S2A_PT2 = PTDerivative(ecg_S2A_PT1, Fs);
ecg_S3B_PT2 = PTDerivative(ecg_S3B_PT1, Fs);
ecg_S3A_PT2 = PTDerivative(ecg_S3A_PT1, Fs);
ecg_S4B_PT2 = PTDerivative(ecg_S4B_PT1, Fs);
ecg_S4A_PT2 = PTDerivative(ecg_S4A_PT1, Fs);

% Step 3: Squaring function
ecg_S1B_PT3 = ecg_S1B_PT2.^2;
ecg_S1A_PT3 = ecg_S1A_PT2.^2;
ecg_S2B_PT3 = ecg_S2B_PT2.^2;
ecg_S2A_PT3 = ecg_S2A_PT2.^2;
ecg_S3B_PT3 = ecg_S3B_PT2.^2;
ecg_S3A_PT3 = ecg_S3A_PT2.^2;
ecg_S4B_PT3 = ecg_S4B_PT2.^2;
ecg_S4A_PT3 = ecg_S4A_PT2.^2;

% Step 4: Moving-Window Integration

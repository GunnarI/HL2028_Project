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

% Detrend signal with polynomial fitting:
ecg_S1B_detr = rm_baseline_poly(t_S1B,ecg_S1B,6);
ecg_S1A_detr = rm_baseline_poly(t_S1A,ecg_S1A,6);
ecg_S2B_detr = rm_baseline_poly(t_S2B,ecg_S2B,6);
ecg_S2A_detr = rm_baseline_poly(t_S2A,ecg_S2A,6);
ecg_S3B_detr = rm_baseline_poly(t_S3B,ecg_S3B,6);
ecg_S3A_detr = rm_baseline_poly(t_S3A,ecg_S3A,6);

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

plotBaselineWanderComparison;

%% Sampling Rate Alteration

% First decimation, then filtering, then interpolation
% Decimation with FIR filter of order 10 (just random low order, see page 466)
% by a factor of 2 (random factor, don't know the details yet)
ecg_S1B_rateAlt = decimate(ecg_S1B_detr,2,10,'fir');

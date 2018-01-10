close all

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

% Subject 5 BEFORE biofeedback session
load S5Before;
t_S5B = S5Before(:,1);
ecg_S5B = S5Before(:,2);
teb_S5B = S5Before(:,3);
% Subject 5 AFTER biofeedback session
load S5After;
t_S5A = S5After(:,1);
ecg_S5A = S5After(:,2);
teb_S5A = S5After(:,3);

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
ecg_S5B_detr = rm_baseline_poly(t_S5B,ecg_S5B,fittingOrder);
ecg_S5A_detr = rm_baseline_poly(t_S5A,ecg_S5A,fittingOrder);

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
ecg_S5B_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S5B_detr);
ecg_S5A_forBack = filtfilt(...
    wanderButt.SOSMatrix, wanderButt.ScaleValues, ecg_S5A_detr);


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
ecg_S5B_rateAlt = samplingRateAlt(ecg_S5B_detr, D, wanderHamm);
ecg_S5A_rateAlt = samplingRateAlt(ecg_S5A_detr, D, wanderHamm);

if (baselineWanderPlots)
    plotBaselineWanderComparison;
end
%% Muscle noise reduction

% Method one: Gaussian filter
% Create a gaussian filter using the function "guassianFilter"
gaussianFilteredICG_S1B = gaussianFilter(icg_S1B_rateAlt);
gaussianFiltered_S1B = gaussianFilter(ecg_S1B_rateAlt);
gaussianFiltered_S1A = gaussianFilter(ecg_S1A_rateAlt);
gaussianFiltered_S2B = gaussianFilter(ecg_S2B_rateAlt);
gaussianFiltered_S2A = gaussianFilter(ecg_S2A_rateAlt);
gaussianFiltered_S3B = gaussianFilter(ecg_S3B_rateAlt);
gaussianFiltered_S3A = gaussianFilter(ecg_S3A_rateAlt);
gaussianFiltered_S4B = gaussianFilter(ecg_S4B_rateAlt);
gaussianFiltered_S4A = gaussianFilter(ecg_S4A_rateAlt);
gaussianFiltered_S5B = gaussianFilter(ecg_S5B_rateAlt);
gaussianFiltered_S5A = gaussianFilter(ecg_S5A_rateAlt);

% Method two: Lowpass filter
lowpassFiltredICG_S1B = filter(lowpassFilter,icg_S1B_rateAlt);
lowpassFiltred_S1B = filter(lowpassFilter,ecg_S1B_rateAlt);
lowpassFiltred_S1A = filter(lowpassFilter,ecg_S1A_rateAlt);
lowpassFiltred_S2B = filter(lowpassFilter,ecg_S2B_rateAlt);
lowpassFiltred_S2A = filter(lowpassFilter,ecg_S2A_rateAlt);
lowpassFiltred_S3B = filter(lowpassFilter,ecg_S3B_rateAlt);
lowpassFiltred_S3A = filter(lowpassFilter,ecg_S3A_rateAlt);
lowpassFiltred_S4B = filter(lowpassFilter,ecg_S4B_rateAlt);
lowpassFiltred_S4A = filter(lowpassFilter,ecg_S4A_rateAlt);
lowpassFiltred_S5B = filter(lowpassFilter,ecg_S5B_rateAlt);
lowpassFiltred_S5A = filter(lowpassFilter,ecg_S5A_rateAlt);

% Method three: Savitzky-Golay filter 
sgolayFilteredICG_S1B = savitzkyGolayFilter(icg_S1B_rateAlt);
sgolayFiltered_S1B = savitzkyGolayFilter(ecg_S1B_rateAlt);
sgolayFiltered_S1A = savitzkyGolayFilter(ecg_S1A_rateAlt);
sgolayFiltered_S2B = savitzkyGolayFilter(ecg_S2B_rateAlt);
sgolayFiltered_S2A = savitzkyGolayFilter(ecg_S2A_rateAlt);
sgolayFiltered_S3B = savitzkyGolayFilter(ecg_S3B_rateAlt);
sgolayFiltered_S3A = savitzkyGolayFilter(ecg_S3A_rateAlt);
sgolayFiltered_S4B = savitzkyGolayFilter(ecg_S4B_rateAlt);
sgolayFiltered_S4A = savitzkyGolayFilter(ecg_S4A_rateAlt);
sgolayFiltered_S5B = savitzkyGolayFilter(ecg_S5B_rateAlt);
sgolayFiltered_S5A = savitzkyGolayFilter(ecg_S5A_rateAlt);

%% QRS Detection
% pan_tompkins algorithm downloaded from: https://se.mathworks.com/matlabcentral/fileexchange/45840-complete-pan-tompkins-implementation-ecg-qrs-detector
% [qrs_amp_alt,qrs_i_alt,delay_alt]=pan_tompkin(ecg_S1A_rateAlt,Fs);
% [qrs_amp_raw,qrs_i_raw,delay_raw]=pan_tompkin(ecg_S1A,Fs);

%% Pan-Tompkins

% [peakAmps_S1B, peakLocs_S1B] = PanTompkins(ecg_S1B_detr, Fs);
% [peakAmps_S1A, peakLocs_S1A] = PanTompkins(ecg_S1A_detr, Fs);
% [peakAmps_S2B, peakLocs_S2B] = PanTompkins(ecg_S2B_detr, Fs);
% [peakAmps_S2A, peakLocs_S2A] = PanTompkins(ecg_S2A_detr, Fs);
% [peakAmps_S3B, peakLocs_S3B] = PanTompkins(ecg_S3B_detr, Fs);
% [peakAmps_S3A, peakLocs_S3A] = PanTompkins(ecg_S3A_detr, Fs);
% [peakAmps_S4B, peakLocs_S4B] = PanTompkins(ecg_S4B_detr, Fs);
% [peakAmps_S4A, peakLocs_S4A] = PanTompkins(ecg_S4A_detr, Fs);
% [peakAmps_S5B, peakLocs_S5B] = PanTompkins(ecg_S5B_detr, Fs);
% [peakAmps_S5A, peakLocs_S5A] = PanTompkins(ecg_S5A_detr, Fs);
% 
% [ECG_Segments, Segments_Datapoints] = ...
%     SeperateECGSegments(ecg_S1B_rateAlt, peakLocs_S1B);

[~, peakLocs_S1B] = PanTompkins(sgolayFiltered_S1B, Fs);
[~, peakLocs_S1A] = PanTompkins(sgolayFiltered_S1A, Fs);
[~, peakLocs_S2B] = PanTompkins(sgolayFiltered_S2B, Fs);
[~, peakLocs_S2A] = PanTompkins(sgolayFiltered_S2A, Fs);
[~, peakLocs_S3B] = PanTompkins(sgolayFiltered_S3B, Fs);
[~, peakLocs_S3A] = PanTompkins(sgolayFiltered_S3A, Fs);
[~, peakLocs_S4B] = PanTompkins(sgolayFiltered_S4B, Fs);
[~, peakLocs_S4A] = PanTompkins(sgolayFiltered_S4A, Fs);
[~, peakLocs_S5B] = PanTompkins(sgolayFiltered_S5B, Fs);
[~, peakLocs_S5A] = PanTompkins(sgolayFiltered_S5A, Fs);

[QLoc, SLoc, TLoc] = getQSTLocations(sgolayFiltered_S1B, peakLocs_S1B);

TEndLoc = getTEnds(sgolayFiltered_S1B, TLoc, Fs);
QStartLoc = getQStart(sgolayFiltered_S1B, QLoc, Fs);

% plot(sgolayFiltered_S1B(1:5000));
% hold on
% plot(QStartLoc(10:20), sgolayFiltered_S1B(QStartLoc(10:20)), 'ro');

%% Local maximum
[r_peak_S1B, r_location_S1B] = findingRPeaks(sgolayFiltered_S1B);
[r_peak_S1A, r_location_S1A] = findingRPeaks(sgolayFiltered_S1A);
[r_peak_S2B, r_location_S2B] = findingRPeaks(sgolayFiltered_S2B);
[r_peak_S2A, r_location_S2A] = findingRPeaks(sgolayFiltered_S2A);
[r_peak_S3B, r_location_S3B] = findingRPeaks(sgolayFiltered_S3B);
[r_peak_S3A, r_location_S3A] = findingRPeaks(sgolayFiltered_S3A);
[r_peak_S4B, r_location_S4B] = findingRPeaks(sgolayFiltered_S4B);
[r_peak_S4A, r_location_S4A] = findingRPeaks(sgolayFiltered_S4A);
[r_peak_S5B, r_location_S5B] = findingRPeaks(sgolayFiltered_S5B);
[r_peak_S5A, r_location_S5A] = findingRPeaks(sgolayFiltered_S5A);

%% Heart rate
% use function "hearRate" to find the heart rate
heart_rate_S1B = heartRate(t_S1B(r_location_S1B));
heart_rate_S1A = heartRate(t_S1A(r_location_S1A));
heart_rate_S2B = heartRate(t_S2B(r_location_S2B));
heart_rate_S2A = heartRate(t_S2A(r_location_S2A));
heart_rate_S3B = heartRate(t_S3B(r_location_S3B));
heart_rate_S3A = heartRate(t_S3A(r_location_S3A));
heart_rate_S4B = heartRate(t_S4B(r_location_S4B));
heart_rate_S4A = heartRate(t_S4A(r_location_S4A));
heart_rate_S5B = heartRate(t_S5B(r_location_S5B));
heart_rate_S5A = heartRate(t_S5A(r_location_S5A));


%% Respiratory Rate

%% Using ECG
vS1B = respiratoryRate(r_location_S1B);
vS1A = respiratoryRate(r_location_S1A);
vS2B = respiratoryRate(r_location_S2B);
vS2A = respiratoryRate(r_location_S2A);
figure
stairs(vS1B)
title('Respiratory Rate')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

%% Using TEB

respRate_S1B = getAvgRespRate(teb_S1B, t_S1B, Fs);
respRate_S1A = getAvgRespRate(teb_S1A, t_S1A, Fs);
respRate_S2B = getAvgRespRate(teb_S2B, t_S2B, Fs);
respRate_S2A = getAvgRespRate(teb_S2A, t_S2A, Fs);
respRate_S3B = getAvgRespRate(teb_S3B, t_S3B, Fs);
respRate_S3A = getAvgRespRate(teb_S3A, t_S3A, Fs);
respRate_S4B = getAvgRespRate(teb_S4B, t_S4B, Fs);
respRate_S4A = getAvgRespRate(teb_S4A, t_S4A, Fs);
respRate_S5B = getAvgRespRate(teb_S5B, t_S5B, Fs);
respRate_S5A = getAvgRespRate(teb_S5A, t_S5A, Fs);

%% Print comparison table
fprintf('\t\t\t\t\t\t\tSubject 1\n');
fprintf('\t\t\t\t\t\tBefore\t After\n');
fprintf('\t\tHear rate [bpm]:\t%d\t\t%d\n',heart_rate_S1B,heart_rate_S1A);
fprintf('Resp. rate [breath/min]:\t%d\t\t%d\n',respRate_S1B,respRate_S1A);

fprintf('\t\t\t\t\t\t\tSubject 2\n');
fprintf('\t\t\t\t\t\tBefore\t After\n');
fprintf('\t\tHear rate [bpm]:\t%d\t\t%d\n',heart_rate_S2B,heart_rate_S2A);
fprintf('Resp. rate [breath/min]:\t%d\t\t%d\n',respRate_S2B,respRate_S2A);

fprintf('\t\t\t\t\t\t\tSubject 3\n');
fprintf('\t\t\t\t\t\tBefore\t After\n');
fprintf('\t\tHear rate [bpm]:\t%d\t\t%d\n',heart_rate_S3B,heart_rate_S3A);
fprintf('Resp. rate [breath/min]:\t%d\t\t%d\n',respRate_S3B,respRate_S3A);

fprintf('\t\t\t\t\t\t\tSubject 4\n');
fprintf('\t\t\t\t\t\tBefore\t After\n');
fprintf('\t\tHear rate [bpm]:\t%d\t\t%d\n',heart_rate_S4B,heart_rate_S4A);
fprintf('Resp. rate [breath/min]:\t%d\t\t%d\n',respRate_S4B,respRate_S4A);

fprintf('\t\t\t\t\t\t\tSubject 5\n');
fprintf('\t\t\t\t\t\tBefore\t After\n');
fprintf('\t\tHear rate [bpm]:\t%d\t\t%d\n',heart_rate_S5B,heart_rate_S5A);
fprintf('Resp. rate [breath/min]:\t%d\t\t%d\n',respRate_S5B,respRate_S5A);
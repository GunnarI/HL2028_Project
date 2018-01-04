clear all
clc
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

Fs = 200;

%% Detrend signal with polynomial fitting:
fittingOrder = 3;
ecg_S1B_detr = rm_baseline_poly(t_S1B,ecg_S1B,fittingOrder);
ecg_S1A_detr = rm_baseline_poly(t_S1A,ecg_S1A,fittingOrder);

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

%% plott
%plotBaselineWanderComparison;

%%
x = ecg_S1B_rateAlt;
Fs = 200;
% 1- signal after baseline filtering
sub1 = subplot(7,1,1);
plot(t_S1B,x)
title('signal after baseline filtering')


% Savitzky–Golay filter
frame = 15;
degree = 0;
y = sgolayfilt(x, degree, frame);
sub2 = subplot(7,1,2);
plot(t_S1B,y)
title('sgolayfilt')


% Moving average filter
window = 15;
h = ones(window,1)/window;
y = filter(h, 1, x);
sub3 = subplot(7,1,3);
plot(t_S1B,y)
title('Moving average filter')

% Sliding Window Method
window = 7;
h = gausswin(2*window+1)./window;
y = zeros(size(x));
for i=1:length(x)
    for j=-window:window;
        if j>-i && j<(length(x)-i+1)             
            y(i) = y(i) + x(i+j) * h(j+window+1);
        end
    end
end

sub4 = subplot(7,1,4);
plot(t_S1B,y)
title('Sliding Window Method')

% Gaussian filter
window = 7;
h = normpdf( -window:window, 0, fix((2*window+1)/6) );
y = filter(h, 1, x);
sub5 = subplot(7,1,5);
plot(t_S1B,y)
title('Gaussian filter')

% Median filter
%The main idea of the median filter is to run through the signal entry by entry,
%replacing each entry with the median of neighboring entries. 
window = 15;
y = medfilt1(x, window);
sub6 = subplot(7,1,6);
plot(t_S1B,y)
title('Median filter')


% lowpass filter
lowpassFiltred = filter(lowpassFilter,ecg_S1B_rateAlt);
sub7 = subplot(7,1,7);
plot(t_S1B,lowpassFiltred)
title('lowpass filter')

axis([sub1 sub2 sub3 sub4 sub5 sub6 sub7],[0 t_S1B(end) -Inf Inf]) 


[peakAmps_S1B, peakLocs_S1B] = PanTompkins(lowpassFiltred(1:2000), Fs);
[ECG_Segments, Segments_Datapoints] = ...
    SeperateECGSegments(lowpassFiltred(1:2000), peakLocs_S1B);

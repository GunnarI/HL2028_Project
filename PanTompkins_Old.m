function [peakAmps, peakLocs] = PanTompkins_Old(ecg, Fs)
% PanTompkins     Applies the Pan-Tompkins algorithm to the ECG signal.
%   The code is based upon the script made by Hooman Sedghamiz and the
%   report by Pan and Tompkins. References provided in the code.
%
%   Use:    [peakAmps, peakLocs] = PanTompkins(ecg, Fs)
%   Before: 
%   After:  


%% References : 
%[1] Sedghamiz. H, "Matlab Implementation of Pan Tompkins ECG QRS detector.", March 2014. https://www.researchgate.net/publication/313673153_Matlab_Implementation_of_Pan_Tompkins_ECG_QRS_detector 
%[2] PAN.J, TOMPKINS. W.J,"A Real-Time QRS Detection Algorithm" IEEE 
%TRANSACTIONS ON BIOMEDICAL ENGINEERING, VOL. BME-32, NO. 3, MARCH 1985. 

% Script by Hooman Sedghamiz: https://se.mathworks.com/matlabcentral/fileexchange/45840-complete-pan-tompkins-implementation-ecg-qrs-detector

%% Code
ecg_zeromean = ecg - mean(ecg);

% Step 1: Apply bandpass filter to raw signal
ecg_bandpass = PTBandpass(ecg_zeromean, Fs);

% Step 2: Derivative filter
ecg_derivative = PTDerivative(ecg_bandpass, Fs);

% Step 3: Squaring function
ecg_squaring = ecg_derivative.^2;

% Step 4: Moving-Window Integration
ecg_window = PTWindow(ecg_squaring, Fs);

% Step 5: Fiducial Mark
[peakAmps, peakLocs] = ...
    findpeaks(ecg_window,'MINPEAKDISTANCE',round(0.2*Fs));

figure
plot(ecg_window)
hold on
plot(peakLocs, peakAmps, 'ro')

end
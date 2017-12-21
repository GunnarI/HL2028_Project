function [peakAmps, peakLocs] = PanTompkins(ecg, Fs)

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

end
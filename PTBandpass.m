function filtSignal = PTBandpass(ecg, Fs)

% Cut-off frequencies as per Pan-Tompkins, 5Hz and 15Hz:
% The bandpass filter reduces the influence of muscle noise, 60 Hz
% interference, baseline wander, and T-wave interference. The desirable
% passband to maximize the QRS energy is approximately 5-15 Hz
f1=5; %cuttoff low frequency to get rid of baseline wander
f2=15; %cuttoff frequency to discard high frequency noise

% The cutoff frequency Wn must be 0.0 < Wn < 1.0, with 1.0 corresponding to
% half the sample rate.
Wn=[f1 f2]*2/Fs;
N = 3;
[a,b] = butter(N,Wn);   % a and b contains the coefficients for the 
                        % butterworth bandpass filter
ecgFilt = filtfilt(a,b,ecg);
filtSignal = ecgFilt;
%filtSignal = ecgFilt/ max( abs(ecgFilt));

end
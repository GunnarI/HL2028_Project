function filtSignal = PTDerivative(ecg, Fs)

T = 1/Fs;
b = (1/(8*T)).*[1 2 0 -2 -1];

ecgFilt = filtfilt(b,1,ecg);
filtSignal = ecgFilt;
%filtSignal = ecgFilt/max(ecgFilt);

end
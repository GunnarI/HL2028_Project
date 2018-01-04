function filtSignal = removePowerline(s, Fs, powerFreq, filtOrder)
% removePowerline     Removes the powerline (50/60Hz) interference of the 
%   signal using a Butterworth IIR notch filter.
%
%   Use:    filtSignal = removePowerline(s, Fs, powerFreq, filtOrder)
%   Before: s is the signal vector of length N, Fs is an integer with
%           containing the sampling frequency, powerFreq is an integer
%           representing the powerline frequency to filter out which is
%           typically 50Hz or 60Hz, filtOrder is an integer representing
%           the filter order
%   After:  filtSignal is a vector of length N with the signal data where
%           the sinusoidal powerlines interference has been filtered out
%powerFreq = round(powerFreq/(Fs/2));
d = designfilt('bandstopiir','FilterOrder',filtOrder, ...
               'HalfPowerFrequency1',powerFreq-1,...
               'HalfPowerFrequency2',powerFreq+1, ...
               'DesignMethod','butter','SampleRate',Fs);

alpha = 2;
w0 = pi*powerFreq/Fs;
b = (1-alpha)*[1 -2*cos(w0) 1];
a = [1 -(alpha+2*(1-alpha)*cos(w0)) (1-alpha)];

w0 = 2*pi*(powerFreq-5)/(Fs/2);
w1 = 2*pi*(powerFreq+5)/(Fs/2);
[b,a] = butter(3,[w0 w1],'stop');
%freqz(b,a)
           
%filtSignal = filtfilt(d,s);
filtSignal = filter(b,a,s); 

end
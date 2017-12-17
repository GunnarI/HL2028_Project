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

d = designfilt('bandstopiir','FilterOrder',filtOrder, ...
               'HalfPowerFrequency1',powerFreq-1,...
               'HalfPowerFrequency2',powerFreq+1, ...
               'DesignMethod','butter','SampleRate',Fs);

filtSignal = filtfilt(d,s);

end
function [ sgolayfiltered ] = savitzkyGolayFilter( ecg_signal )
%A Savitzky–Golay filter is for the purpose of smoothing the data and it 
% increases the signal-to-noise ratio without greatly distorting the signal.

order = 3; % order of the polynomial used for smothing
framelen = 11; % frame length
sgolayfiltered = sgolayfilt(ecg_signal, order, framelen);

end


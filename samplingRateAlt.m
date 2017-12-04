function filteredData = ...
    samplingRateAlt(s, freqFactor, decFIROrder, FIRFilter)
% samplingRateAlt   Filters signal using the Sampling Rate Alteration
%   method together with a FIR filter
%
%   Use:    filteredData = 
%                   samplingRateAlt(s, freqFactor, decFIROrder, FIRFilter)
%   Before: s is the signal vector of length N; freqFactor is an integer 
%           with the order of which the signal will be downsampled (e.g. an
%           order of 2 for a signal of frequency 200Hz will downsample to a
%           frequency of 100Hz); decFIROrder is an integer with the order 
%           of the FIR filter used in the downsampling process; and
%           FIRFilter is a FIRFilter object containing the filter to be
%           used after downsampling and before interpolation
%   After:  filteredData is a vector of length N containing the filtered 
%           signal after upsampling again.

s_dec = decimate(s, freqFactor, decFIROrder, 'fir');

s_dec_filt = filter(dfilt.dffir(FIRFilter.Numerator), s_dec);
filteredData = interp(s_dec_filt, freqFactor);

filteredData = filteredData(1:end-abs(length(filteredData)-length(s)));
end
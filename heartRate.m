function [ hr_mean, hr_bps, hr_rmssd ] = heartRate( r_peaks_location )
% HEART RATE = 60 / (RR interval in seconds).

% creat a new vector for RR-peaks interval
vector = zeros(1,round(length(r_peaks_location)/2)+1);

jj = 1; 
for ii = 2:length(r_peaks_location)    
    vector(jj) = r_peaks_location(ii)-r_peaks_location(ii-1);
    jj = jj + 1;
end

hr_rmssd = getRMSSD(vector);

% HR beats per second for each RR interval
hr_bps = 1./vector;

% calculating the mean value for RR-interval without the first peak
rr_meanValue = mean(vector(2:end));

% heart rate
hr = 60 / rr_meanValue; 
hr_mean = round(hr);


end


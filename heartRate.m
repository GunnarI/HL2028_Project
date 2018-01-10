function [ heart_rate ] = heartRate( r_peaks_location )
% HEART RATE = 60 / (RR interval in seconds).

% creat a new vector for RR-peaks interval
vector = zeros(1,round(length(r_peaks_location)/2)+1);

jj = 1; 
for ii = 2:length(r_peaks_location)    
    vector(jj) = r_peaks_location(ii)-r_peaks_location(ii-1);
    jj = jj + 1;
end

% calculating the mean value for RR-interval without the first peak
rr_meanValue = mean(vector(2:end));

% heart rate
hr = 60 / rr_meanValue; 
heart_rate = round(hr);


end


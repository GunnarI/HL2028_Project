function [ vector ] = respiratoryRate(r_peaks_location)

% creat a new vector for differences in RR-interval
vector = zeros(1,round(length(r_peaks_location)/2)+1);

jj = 1; 
for ii = 2:length(r_peaks_location)    
    vector(jj) = r_peaks_location(ii)-r_peaks_location(ii-1);
    jj = jj + 1;
end

end


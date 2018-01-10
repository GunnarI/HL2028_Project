function [ BMP ] = heart_Rate_v2( ecg_signal )
% count the peaks above 55 mv (R_peaks)
% peaks are defined to be sampels greater than their two neighbours and
% greater than 55.

beat_count = 0;
Fs = 200;
for ii = 2:length(ecg_signal)-1
    if ecg_signal(ii) > ecg_signal(ii-1) & ecg_signal(ii) > ecg_signal(ii+1) & ecg_signal(ii) > 55
        beat_count = beat_count + 1;
    end
end

N = length(ecg_signal);
duration_in_seconds = N/Fs;
duration_in_minutes = duration_in_seconds/60;
HR = beat_count/duration_in_minutes;
BMP = round (HR);

end


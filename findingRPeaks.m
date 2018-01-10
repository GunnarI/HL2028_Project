function [peak,location] = findingRPeaks( ecg_signal )
% findingRPeaks finds peaks and location for those peaks that have ...
% amplitude above 50 mV.

[peak,location]=findpeaks(ecg_signal,'MinPeakHeight',55);

end


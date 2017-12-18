function detrendedECG = rm_baseline_poly(t,ecg,opol)
% rm_baseline_poly     Removes the trend baseline wander of an ECG signal
%   using polynomial fitting.
%
%   Use:    detrendedECG = rm_baseline_poly(t,ecg,opol)
%   Before: ecg is the signal vector of length N, t is the time vector of 
%           length N and opol is an integer representing the order of the 
%           polynomial to be fitted to the data.
%   After:  detrendedECG is a vector of length N with the ecg data where
%           the polynomial that represents the baseline has been subtracted
%           from the original ecg.
[p,~,mu] = polyfit(t,ecg,opol);
f_y = polyval(p,t,[],mu);

detrendedECG = ecg - f_y;
end
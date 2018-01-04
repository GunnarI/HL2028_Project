function [RPeakAmp,RPeakLoc] = PanTompkins(ecg, Fs)
% PanTompkins     Applies the Pan-Tompkins algorithm to the ECG signal.
%   The script was made by Hooman Sedghamiz which follows the Pan Tompkins
%   algorithm as reported by Pan and Tompkins.
%
%   Use:    [peakAmps, peakLocs] = PanTompkins(ecg, Fs)
%   Before: ecg is a vector containing the raw ecg measurements and Fs is 
%           the sampling frequency of these measurements. The sampling
%           frequency should ideally be 200Hz as stated in the report by
%           Pan and Tompkins but the script made by Hooman Sedghamiz does
%           account for if the frequency is not that.
%   After:  peakAmps is a vector containing the amplitude value of all the
%           R-peaks. peakLocs is a vector containing the index location of
%           the R-peaks in the ecg vector.

% The below info states the references used for in the function pan_tompkin
% which is used below and was created by Hooman Sedghamiz.
%% References : 
%[1] Sedghamiz. H, "Matlab Implementation of Pan Tompkins ECG QRS detector.", March 2014. https://www.researchgate.net/publication/313673153_Matlab_Implementation_of_Pan_Tompkins_ECG_QRS_detector 
%[2] PAN.J, TOMPKINS. W.J,"A Real-Time QRS Detection Algorithm" IEEE 
%TRANSACTIONS ON BIOMEDICAL ENGINEERING, VOL. BME-32, NO. 3, MARCH 1985. 
%% Author : Hooman Sedghamiz 
% Linkoping university 
% email : hoose792@student.liu.se 
% Copyright march 2014 

%% NOTE: The code can be retrieved from https://se.mathworks.com/matlabcentral/fileexchange/45840-complete-pan-tompkins-implementation-ecg-qrs-detector
% and the author is Hooman Sedghamiz. Two minor modification were made to
% the code in this application:
% Modification: Put an if statement around line 159 and line 154 to not 
%               start the plots if the plots are unwanted (gr=0)

%% The function call
[RPeakAmp,RPeakLoc,delay]=pan_tompkin(ecg,Fs,0);

end
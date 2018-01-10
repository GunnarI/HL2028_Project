function [QLoc, SLoc, TLoc] = getQSTLocations(ecg, RLoc)
% getQSTLocations    Gives the data point number for the Q, S, and T peaks
%   of QRST complexes.
%
%   Call: [QLoc, SLoc, TLoc] = getQSTLocations(ECGSegments, RLoc) 
%   
%   Before: ECGSegments is a M-by-N matrix where M is the number of ECG
%   segments and each line contains equal amount of datapoints for
%   different ECG segments. Each ECG segment has the R peak at the same
%   position and RLoc is a scalar with the data point number for that
%   position.
%
%   After: QLoc, SLoc, and TLoc each contain a vector of the length M with
%   the locations of the Q peak, S peak, and T peak respectively for each
%   ECG segment.

nrSegments = length(RLoc);

QLoc = zeros(1,nrSegments);
SLoc = zeros(1,nrSegments);
TLoc = zeros(1,nrSegments);

refPoint1 = 1;
refPoint2 = RLoc(1)+ceil((RLoc(2)-RLoc(1))/2);
segment = ecg(refPoint1:refPoint2);
QLoc(1) = refPoint1 + find(segment == min(segment(1:RLoc(1)))) - 1;
SLoc(1) = refPoint1 + find(segment == min(segment(RLoc(1):end))) - 1;
TLoc(1) = refPoint1 + find(segment == max(segment(SLoc(1):end))) - 1;

for i = 2:nrSegments-1
    refPoint1 = RLoc(i-1)+ceil((RLoc(i)-RLoc(i-1))/2+1);
    refPoint2 = RLoc(i)+ceil((RLoc(i+1)-RLoc(i))/2+1);
    segment = ecg(refPoint1:refPoint2);
    QLoc(i) = refPoint1 + find(segment == min(ecg(refPoint1:RLoc(i)))) - 1;
    SLoc(i) = refPoint1 + find(segment == min(ecg(RLoc(i):refPoint2))) - 1;
    TLoc(i) = refPoint1 + find(segment == max(ecg(SLoc(i):refPoint2))) - 1;
end

refPoint1 = ceil((RLoc(end)-RLoc(end-1))/2+1);
segment = ecg(refPoint1:end);
QLoc(end) = refPoint1 + find(segment == min(ecg(refPoint1:RLoc(end)))) - 1;
SLoc(end) = refPoint1 + find(segment == min(ecg(RLoc(end):end))) - 1;
TLoc(end) = refPoint1 + find(segment == max(ecg(SLoc(end):end))) - 1;

end
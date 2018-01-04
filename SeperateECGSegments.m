function [ECG_Segments, Segments_Datapoints] = ...
    SeperateECGSegments(ECGSignal, RLocations)
% SeperateECGSegments    Seperates ECG data into seperate PQRST segments
%   The segments are seperated in the middle of two consecutive R waves.
%
%   SeperateECGSegments(ECGSignal, RLocations) returns an N-by-2 cell 
%   matrix where in each row we have the information for each segment.  
%   Column 1 contains the amplitude vector and column 2 contains the sample
%   number vector.
%
%   Note: ECGSignal should be given in mV and Fs should be given in Hz. 
%   Works only for ECG data where the amplitude of the R waves and only are
%   the R waves are above 0.5mV and their frequency does not exceed 10/3 Hz

ECG_Segments = cell(length(RLocations),1);
Segments_Datapoints = cell(length(RLocations),1);

% Extract the first and last segment of ECG data and insert into the return
% variable
ECGFirstSegmentEnd = RLocations(1)+...
    floor((RLocations(2)-RLocations(1))*3/4);
if (floor((RLocations(2)-RLocations(1))/4)<RLocations(1))
    ECGFirstSegmentStart = ...
        RLocations(1)-floor((RLocations(2)-RLocations(1))/4);
else
    ECGFirstSegmentStart = 1;
end
ECGFirstSegment = ECGFirstSegmentStart:ECGFirstSegmentEnd;
ECG_Segments{1} = ECGSignal(ECGFirstSegment);
Segments_Datapoints{1} = ECGFirstSegment;

ECGLastSegmentStart = RLocations(end)-...
    floor((RLocations(end)-RLocations(end-1))/4);
if (floor((RLocations(end)-RLocations(end-1))*3/4)<...
        (length(ECGSignal)-RLocations(end)))
    ECGLastSegmentEnd = RLocations(end)+...
        floor((RLocations(end)-RLocations(end-1))*3/4);
else
    ECGLastSegmentEnd = length(ECGSignal);
end
ECGLastSegment = ECGLastSegmentStart:ECGLastSegmentEnd;
ECG_Segments{end} = ECGSignal(ECGLastSegment);
Segments_Datapoints{end} = ECGLastSegment;

% Extract the rest of the ECG segments from the data and insert into the
% return variable
figure
for i = 2:length(RLocations)-1
   ECGSegmentStart = RLocations(i)-...
       floor((RLocations(i)-RLocations(i-1))/4);
   ECGSegmentEnd = RLocations(i)+...
       floor((RLocations(i+1)-RLocations(i))*3/4);
   ECGSegment = ECGSegmentStart:ECGSegmentEnd;
   
   ECG_Segments{i} = ECGSignal(ECGSegment);
   Segments_Datapoints{i} = ECGSegment;
   hold on
   plot(ECG_Segments{i});
end

end
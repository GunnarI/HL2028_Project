function QStartLoc = getQStart(ecg, QLoc, Fs)
% Code follows the guidelines of following linked report:
% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3201026/

winSize = 0.08*Fs; % 80ms window
QStartLoc = zeros(1,length(QLoc));

for i = 1:length(QLoc)
    winVec1 = ecg(QLoc(i)-winSize:QLoc(i));
    [~,minDiffLoc] = min(diff(winVec1));
    xm = QLoc(i)-winSize+minDiffLoc;
    
    winVec2 = ecg(QLoc(i)-2*winSize:QLoc(i)-winSize);
    [~,maxDiffLoc] = max(diff(winVec2));
    xr = QLoc(i)-2*winSize+maxDiffLoc;
    
    A = 0;
    for xi = xr:xm
        Atemp = 0.5*(ecg(xi)-ecg(xm))*(2*xm-xi-xr);
        if (Atemp > A)
            A = Atemp;
            QStartLoc(i) = xi;
        end
    end
end

end
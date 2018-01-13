function TEndLoc = getTEnds(ecg, TLoc, Fs)
% Code follows the guidelines of following linked report:
% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3201026/

winSize = 0.1*Fs; % 100ms window
TEndLoc = zeros(1,length(TLoc));

numData = length(ecg);

for i = 1:length(TLoc)
    if ((TLoc(i)+2*winSize)>numData)
        TEndLoc = TEndLoc(1:i-1);
        break;
    end
    
    winVec1 = ecg(TLoc(i):TLoc(i)+winSize);
    [~,minDiffLoc] = min(diff(winVec1));
    xm = TLoc(i)+minDiffLoc;
    
    winVec2 = ecg(TLoc(i)+winSize:TLoc(i)+2*winSize);
    [~,maxDiffLoc] = max(diff(winVec2));
    xr = TLoc(i)+winSize+maxDiffLoc;
    
    A = 0;
    for xi = xm:xr
        Atemp = 0.5*(ecg(xm)-ecg(xi))*(2*xr-xi-xm);
        if (Atemp > A)
            A = Atemp;
            TEndLoc(i) = xi;
        end
    end
end

end
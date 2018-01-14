function rMSSD = getRMSSD(rr_interv)

sucDiff = abs(diff(rr_interv));
summedSquareDiff = sum(sucDiff.^2);

rMSSD = sqrt(summedSquareDiff/(length(rr_interv)-1))*1000;

end
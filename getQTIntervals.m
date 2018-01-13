function [QTIntervals, QStartLoc, TEndLoc] = getQTIntervals(ecg, RLocs, Fs)

QTIntervals = zeros(1,length(RLocs));

[QLoc, ~, TLoc] = getQSTLocations(ecg, RLocs);

TEndLoc = getTEnds(ecg, TLoc(2:end-1), Fs);
QStartLoc = getQStart(ecg, QLoc(2:end-1), Fs);

if(length(TEndLoc)<length(QStartLoc))
    QStartLoc = QStartLoc(1:length(TEndLoc));
end

% figure
% plot(ecg)
% hold on
% plot(TEndLoc, ecg(TEndLoc), 'ro', QStartLoc, ecg(QStartLoc), 'rx')

for i = 1:length(TEndLoc)
    QTIntervals(i) = (TEndLoc(i)-QStartLoc(i))/200;
end

QTIntervals(0.7 < QTIntervals | QTIntervals < 0.3) = mean(QTIntervals);

end
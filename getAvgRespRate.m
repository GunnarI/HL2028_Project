function avgRate = getAvgRespRate(teb, t, Fs)

teb = chebyBand(teb.^4-rm_baseline_poly(t, teb, 10).^4, Fs);

[a, breath_Loc] = ...
    findpeaks(teb, t, 'MinPeakHeight',0, 'MinPeakDistance', 2);

% figure
% plot(t,teb)
% hold on
% plot(breath_Loc, a, 'ro')

avgRate = round(60/mean(diff(breath_Loc)));

end
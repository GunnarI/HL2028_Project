function detrendeECG = rm_baseline_poly(t,ecg,opol)
[p,~,mu] = polyfit(t,ecg,opol);
f_y = polyval(p,t,[],mu);

detrendeECG = ecg - f_y;
plot(detrendeECG);
end
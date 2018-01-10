function filteredSignal = gaussianFilter( ecg_signal )
% Gaussian filtering is used to smooth the signal and remove noise and detail.
% Gaussian filter use the matlab function normpdf that ...
% using the normal distribution with mean mu and standard deviation sigma. 

mu = 0;
window = 8;
sigma = fix((2*window+1)/6);
y = normpdf( -window:window, mu, sigma );
filteredSignal = filter(y, 1, ecg_signal);

end


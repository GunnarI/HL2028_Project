function filtSignal = gaussFilter(ecg, window)

h = normpdf( -window:window, 0, fix((2*window+1)/6) );
filtSignal = filter(h, 1, ecg);

end
function filtSignal = PTWindow(ecg, Fs)

filtSignal = conv(ecg ,ones(1 ,round(0.150*Fs))/round(0.150*Fs));

end
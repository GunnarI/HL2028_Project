function filtSignal = PTLowpass(ecg)

a = [1 -2 1];
b = [1 0 0 0 0 0 -2 0 0 0 0 0 1];

filtSignal = filter(b,a,ecg); 
end
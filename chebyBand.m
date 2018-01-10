function filtSignal = chebyBand(s, Fs)

Fn = Fs/2;
Wp = [0.1 10]/Fn;
Ws = [0.05 20]/Fn;
Rp = 10;
Rs = 30;
[n, Ws] = cheb2ord(Wp, Ws, Rp, Rs);
[b, a] = cheby2(n, Rs, Ws);

filtSignal = filter(b,a,s);

end
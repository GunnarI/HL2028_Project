
%% Subject 1 RR plots
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'HR of subject 1 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
hr_rloc_S1B = r_location_S1B(3:end);
plot(t_S1B(hr_rloc_S1B), hr_S1B(2:end))
title('HR before biofeedback (time domain)')
xlabel('Time [s]')
ylabel('HR [Hz]')
sub2 = subplot(4,1,2);
plot(hr_FFT_f_S1B.*1000, hr_FFT_p_S1B);
title('HR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [Hz]')
ylabel('Amplitude')
xlim([3.5 400])
sub3 = subplot(4,1,3);
hr_rloc_S1A = r_location_S1A(2:end);
plot(t_S1B(hr_rloc_S1A), hr_S1A)
title('HR after biofeedback (time domain)')
xlabel('Time [s]')
ylabel('HR [Hz]')
sub4 = subplot(4,1,4);
plot(hr_FFT_f_S1A.*1000, hr_FFT_p_S1A);
title('HR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [Hz]')
ylabel('Amplitude')
xlim([3.5 400])

%% Subject 1: QT plots
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'HR of subject 1 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(t_S1B(peakLocs_S1B), QTInterval_S1B)
title('QT Interval before biofeedback (time domain)')
xlabel('Time [s]')
ylabel('Interval [s]')
sub2 = subplot(4,1,2);
plot(qt_FFT_f_S1B.*1000, qt_FFT_p_S1B);
title('QT Interval before biofeedback (frequency domain, FFT)')
xlabel('Freq. [Hz]')
ylabel('Amplitude')
xlim([3.5 400])
sub3 = subplot(4,1,3);
plot(t_S1B(peakLocs_S1A), QTInterval_S1A)
title('QT Interval after biofeedback (time domain)')
xlabel('Time [s]')
ylabel('Interval [s]')
sub4 = subplot(4,1,4);
plot(qt_FFT_f_S1A.*1000, qt_FFT_p_S1A);
title('QT Interval after biofeedback (frequency domain, FFT)')
xlabel('Freq. [Hz]')
ylabel('Amplitude')
xlim([3.5 400])

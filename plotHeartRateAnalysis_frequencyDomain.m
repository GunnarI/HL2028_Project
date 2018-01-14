%% Subject 1 RR plots
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 1 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_FFT_f_S1B.*1000, hr_FFT_p_S1B);
title('LF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_FFT_f_S1A.*1000, hr_FFT_p_S1A);
title('LF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_FFT_f_S1B.*1000, hr_FFT_p_S1B);
title('HF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_FFT_f_S1A.*1000, hr_FFT_p_S1A);
title('HF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 1 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_lomb_f_S1B.*1000, hr_lomb_p_S1B);
title('LF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_lomb_f_S1A.*1000, hr_lomb_p_S1A);
title('LF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_lomb_f_S1B.*1000, hr_lomb_p_S1B);
title('HF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_lomb_f_S1A.*1000, hr_lomb_p_S1A);
title('HF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

%% Subject 2 RR plots
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 2 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_FFT_f_S2B.*1000, hr_FFT_p_S2B);
title('LF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_FFT_f_S2A.*1000, hr_FFT_p_S2A);
title('LF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_FFT_f_S2B.*1000, hr_FFT_p_S2B);
title('HF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_FFT_f_S2A.*1000, hr_FFT_p_S2A);
title('HF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 2 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_lomb_f_S2B.*1000, hr_lomb_p_S2B);
title('LF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_lomb_f_S2A.*1000, hr_lomb_p_S2A);
title('LF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_lomb_f_S2B.*1000, hr_lomb_p_S2B);
title('HF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_lomb_f_S2A.*1000, hr_lomb_p_S2A);
title('HF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

%% Subject 3 RR plots
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 3 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_FFT_f_S3B.*1000, hr_FFT_p_S3B);
title('LF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_FFT_f_S3A.*1000, hr_FFT_p_S3A);
title('LF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_FFT_f_S3B.*1000, hr_FFT_p_S3B);
title('HF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_FFT_f_S3A.*1000, hr_FFT_p_S3A);
title('HF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 3 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_lomb_f_S3B.*1000, hr_lomb_p_S3B);
title('LF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_lomb_f_S3A.*1000, hr_lomb_p_S3A);
title('LF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_lomb_f_S3B.*1000, hr_lomb_p_S3B);
title('HF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_lomb_f_S3A.*1000, hr_lomb_p_S3A);
title('HF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

%% Subject 4 RR plots
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 4 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_FFT_f_S4B.*1000, hr_FFT_p_S4B);
title('LF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_FFT_f_S4A.*1000, hr_FFT_p_S4A);
title('LF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_FFT_f_S4B.*1000, hr_FFT_p_S4B);
title('HF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_FFT_f_S4A.*1000, hr_FFT_p_S4A);
title('HF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 4 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_lomb_f_S4B.*1000, hr_lomb_p_S4B);
title('LF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_lomb_f_S4A.*1000, hr_lomb_p_S4A);
title('LF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_lomb_f_S4B.*1000, hr_lomb_p_S4B);
title('HF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_lomb_f_S4A.*1000, hr_lomb_p_S4A);
title('HF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

%% Subject 5 RR plots
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 5 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_FFT_f_S5B.*1000, hr_FFT_p_S5B);
title('LF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_FFT_f_S5A.*1000, hr_FFT_p_S5A);
title('LF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_FFT_f_S5B.*1000, hr_FFT_p_S5B);
title('HF RR before biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_FFT_f_S5A.*1000, hr_FFT_p_S5A);
title('HF RR after biofeedback (frequency domain, FFT)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])

figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'RR Analysis of subject 5 before and after Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(hr_lomb_f_S5B.*1000, hr_lomb_p_S5B);
title('LF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub2 = subplot(4,1,2);
plot(hr_lomb_f_S5A.*1000, hr_lomb_p_S5A);
title('LF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([40 150])
sub3 = subplot(4,1,3);
plot(hr_lomb_f_S5B.*1000, hr_lomb_p_S5B);
title('HF RR before biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
sub4 = subplot(4,1,4);
plot(hr_lomb_f_S5A.*1000, hr_lomb_p_S5A);
title('HF RR after biofeedback (frequency domain, lomb)')
xlabel('Freq. [mHz]')
ylabel('Amplitude')
xlim([150 400])
%% Plot the comparison of baseline wander filtering using the two methods 
% of forward-backward filtering with a Butterworth IIR filter and a Hamming
% window FIR filtering with the method of sampling rate alteration

%% Subject 1 before biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 1 Before Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')
sub1 = subplot(3,1,1);
plot(t_S1B,ecg_S1B_detr)
title('Before baseline wander filtering')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(3,1,2);
plot(t_S1B,ecg_S1B_forBack)
title('Forward-backward IIR filtered')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(3,1,3);
plot(t_S1B,ecg_S1B_rateAlt(1:length(t_S1B)))
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3],[0 t_S1B(end) -Inf Inf]) 

%% Subject 1 after biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 1 After Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')
sub1 = subplot(3,1,1);
plot(t_S1A,ecg_S1A_detr)
title('Before baseline wander filtering')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(3,1,2);
plot(t_S1A,ecg_S1A_forBack)
title('Forward-backward IIR filtered')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(3,1,3);
plot(t_S1A,ecg_S1A_rateAlt(1:length(t_S1A)))
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3],[0 t_S1A(end) -Inf Inf]) 

%%  Subject 2 before biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 2 Before Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')
sub1 = subplot(3,1,1);
plot(t_S2B,ecg_S2B_detr)
title('Before baseline wander filtering')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(3,1,2);
plot(t_S2B,ecg_S2B_forBack)
title('Forward-backward IIR filtered')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(3,1,3);
plot(t_S2B,ecg_S2B_rateAlt(1:length(t_S2B)))
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3],[0 t_S2B(end) -Inf Inf]) 

%%  Subject 2 after biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 2 After Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')
sub1 = subplot(3,1,1);
plot(t_S2A,ecg_S2A_detr)
title('Before baseline wander filtering')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(3,1,2);
plot(t_S2A,ecg_S2A_forBack)
title('Forward-backward IIR filtered')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(3,1,3);
plot(t_S2A,ecg_S2A_rateAlt(1:length(t_S2A)))
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3],[0 t_S2A(end) -Inf Inf]) 

%%  Subject 3 before biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 3 Before Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')
sub1 = subplot(3,1,1);
plot(t_S3B,ecg_S3B_detr)
title('Before baseline wander filtering')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(3,1,2);
plot(t_S3B,ecg_S3B_forBack)
title('Forward-backward IIR filtered')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(3,1,3);
plot(t_S3B,ecg_S3B_rateAlt(1:length(t_S3B)))
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3],[0 t_S3B(end) -Inf Inf]) 

%%  Subject 3 after biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 3 After Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')
sub1 = subplot(3,1,1);
plot(t_S3A,ecg_S3A_detr)
title('Before baseline wander filtering')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(3,1,2);
plot(t_S3A,ecg_S3A_forBack)
title('Forward-backward IIR filtered')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(3,1,3);
plot(t_S3A,ecg_S3A_rateAlt(1:length(t_S3A)))
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3],[0 t_S3A(end) -Inf Inf]) 

%%  Subject 4 before biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 4 Before Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')
sub1 = subplot(3,1,1);
plot(t_S4B,ecg_S4B_detr)
title('Before baseline wander filtering')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(3,1,2);
plot(t_S4B,ecg_S4B_forBack)
title('Forward-backward IIR filtered')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(3,1,3);
plot(t_S4B,ecg_S4B_rateAlt(1:length(t_S4B)))
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3],[0 t_S4B(end) -Inf Inf]) 

%%  Subject 4 after biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 4 After Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')
sub1 = subplot(3,1,1);
plot(t_S4A,ecg_S4A_detr)
title('Before baseline wander filtering')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(3,1,2);
plot(t_S4A,ecg_S4A_forBack)
title('Forward-backward IIR filtered')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(3,1,3);
plot(t_S4A,ecg_S4A_rateAlt(1:length(t_S4A)))
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3],[0 t_S4A(end) -Inf Inf]) 

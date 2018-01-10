
%% Plot the comparison of muscle noise filtering using the three methods
% 1- Gaussian filter
% 2- Lowpass filter
% 3- Savitzky-Golay filter 

%% Subject 1 before biofeedback
figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'ECG of subject 1 Before Biofeedback', ...
    'EdgeColor', 'none', ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center')

sub1 = subplot(4,1,1);
plot(t_S1B,ecg_S1B_rateAlt);
title('Hamming window FIR filtered with sampling rate alteration')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub2 = subplot(4,1,2);
plot(t_S1B,gaussianFiltered_S1B);
title('Gaussian filter')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub3 = subplot(4,1,3);
plot(t_S1B,lowpassFiltred_S1B);
title('Lowpass filter')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

sub4 = subplot(4,1,4);
plot(t_S1B, sgolayFiltered_S1B);
hold on
plot(r_location_S1B,r_peak_S1B,'x');
title('Savitzky-Golay filter')
xlabel('Time [s]')
ylabel('Amplitude [mV]')

axis([sub1 sub2 sub3 sub4],[0 t_S1B(end) -Inf Inf]) 

% 
% %% Subject 1 after biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 1 After Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S1A,ecg_S1A_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S1A,gaussianFiltered_S1A);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S1A,lowpassFiltred_S1A);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S1A, sgolayFiltered_S1A);
% hold on
% plot(r_location_S1A,r_peak_S1A,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S1A(end) -Inf Inf])
% %% Subject 2 before biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 2 Before Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S2B,ecg_S2B_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S2B,gaussianFiltered_S2B);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S2B,lowpassFiltred_S2B);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S2B, sgolayFiltered_S2B);
% hold on
% plot(r_location_S2B,r_peak_S2B,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S2B(end) -Inf Inf]) 
% 
% %% Subject 2 after biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 2 After Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S2A,ecg_S2A_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S2A,gaussianFiltered_S2A);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S2A,lowpassFiltred_S2A);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S2A, sgolayFiltered_S2A);
% hold on
% plot(r_location_S2A,r_peak_S2A,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S2A(end) -Inf Inf])
% %% Subject 3 before biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 3 Before Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S3B,ecg_S3B_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S3B,gaussianFiltered_S3B);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S3B,lowpassFiltred_S3B);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S3B, sgolayFiltered_S3B);
% hold on
% plot(r_location_S3B,r_peak_S3B,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S3B(end) -Inf Inf]) 
% 
% %% Subject 3 after biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 3 After Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S3A,ecg_S3A_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S3A,gaussianFiltered_S3A);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S3A,lowpassFiltred_S3A);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S3A, sgolayFiltered_S3A);
% hold on
% plot(r_location_S3A,r_peak_S3A,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S3A(end) -Inf Inf])
% 
% %% Subject 4 before biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 4 Before Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S4B,ecg_S4B_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S4B,gaussianFiltered_S4B);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S4B,lowpassFiltred_S4B);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S4B, sgolayFiltered_S4B);
% hold on
% plot(r_location_S4B,r_peak_S4B,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S4B(end) -Inf Inf]) 
% 
% %% Subject 4 after biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 4 After Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S4A,ecg_S4A_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S4A,gaussianFiltered_S4A);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S4A,lowpassFiltred_S4A);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S4A, sgolayFiltered_S4A);
% hold on
% plot(r_location_S4A,r_peak_S4A,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S4A(end) -Inf Inf])
% %% Subject 5 before biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 5 Before Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S5B,ecg_S5B_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S5B,gaussianFiltered_S5B);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S5B,lowpassFiltred_S5B);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S5B, sgolayFiltered_S5B);
% hold on
% plot(r_location_S5B,r_peak_S5B,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S5B(end) -Inf Inf]) 
% 
% %% Subject 5 after biofeedback
% figure
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'ECG of subject 5 After Biofeedback', ...
%     'EdgeColor', 'none', ...
%     'FontWeight', 'bold', ...
%     'HorizontalAlignment', 'center')
% 
% sub1 = subplot(4,1,1);
% plot(t_S5A,ecg_S5A_rateAlt);
% title('Hamming window FIR filtered with sampling rate alteration')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub2 = subplot(4,1,2);
% plot(t_S5A,gaussianFiltered_S5A);
% title('Gaussian filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub3 = subplot(4,1,3);
% plot(t_S5A,lowpassFiltred_S5A);
% title('Lowpass filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% sub4 = subplot(4,1,4);
% plot(t_S5A, sgolayFiltered_S5A);
% hold on
% plot(r_location_S5A,r_peak_S5A,'x');
% title('Savitzky-Golay filter')
% xlabel('Time [s]')
% ylabel('Amplitude [mV]')
% 
% axis([sub1 sub2 sub3 sub4],[0 t_S5A(end) -Inf Inf])

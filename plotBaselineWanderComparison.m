% Plot the 

plot(t_S1B,ecg_S1B_detr,'b',t_S1B,ecg_S1B_forBack,'r')
title('Subject 1: Before biofeedback')
xlabel('Time [s]')
ylabel('Amplitude [mV]')
legend('Before Butterworth Filtering','After Butterworth Filtering')
figure
plot(t_S1A,ecg_S1A_detr,'b',t_S1A,ecg_S1A_forBack,'r')
title('Subject 1: After biofeedback')
xlabel('Time [s]')
ylabel('Amplitude [mV]')
legend('Before Butterworth Filtering','After Butterworth Filtering')
figure
plot(t_S2B,ecg_S2B_detr,'b',t_S2B,ecg_S2B_forBack,'r')
title('Subject 2: Before biofeedback')
xlabel('Time [s]')
ylabel('Amplitude [mV]')
legend('Before Butterworth Filtering','After Butterworth Filtering')
figure
plot(t_S2A,ecg_S2A_detr,'b',t_S2A,ecg_S2A_forBack,'r')
title('Subject 2: After biofeedback')
xlabel('Time [s]')
ylabel('Amplitude [mV]')
legend('Before Butterworth Filtering','After Butterworth Filtering')
figure
plot(t_S3B,ecg_S3B_detr,'b',t_S3B,ecg_S3B_forBack,'r')
title('Subject 3: Before biofeedback')
xlabel('Time [s]')
ylabel('Amplitude [mV]')
legend('Before Butterworth Filtering','After Butterworth Filtering')
figure
plot(t_S3A,ecg_S3A_detr,'b',t_S3A,ecg_S3A_forBack,'r')
title('Subject 3: After biofeedback')
xlabel('Time [s]')
ylabel('Amplitude [mV]')
legend('Before Butterworth Filtering','After Butterworth Filtering')
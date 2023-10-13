clc;
clear all;
close all;

time = 0:0.0005:0.25;  
f0 = 30;
w0 = 2*pi*f0;
c = 10*sqrt(2);
k = 50;
sys = tf([c,50],[1,c,50]);

H_jw0 = (k+c*w0*1i)/(-w0^2+c*w0*1i+k);
a_w0 = abs(H_jw0);
phi = (angle(H_jw0));


input_FRF = sin(2*pi*f0.*time);
Y_FRF = lsim(sys,input_FRF,time);

FRF_result = a_w0*sin(2*pi*f0.*time+phi);

plot(time,input_FRF, 'k--', 'LineWidth', 2); hold on;
plot(time, Y_FRF,'r','linewidth',2); hold on;
plot(time, FRF_result,'g','linewidth',2)
xlabel('Time[sec]');
ylabel('Amplitude[m]');
title('System response');
grid on;
grid minor;
ylim([-2 2]);
legend('Input z(t)', 'Simulated Response x(t)','Particular Solution xp(t) from FRF');

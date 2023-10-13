clc;
clear all;
close all;

t = 0:0.01:10;  
DampingRatio = 1.0; 
k = 50;
c = sqrt(50) * 2 * DampingRatio;

sys = tf([c,50],[1,c,50]);

u = zeros(size(t));
u(t >= 2 & t < 3) = 0.02 * (t(t >= 2 & t < 3) - 2);
u(t >= 3) = 0.02;

y = lsim(sys, u, t);

plot(t,u, 'k--', 'LineWidth', 2); hold on;
plot(t, y);
xlabel('Time[sec]');
ylabel('Amplitude[m]');
title('System response');
grid on;
grid minor;
legend('Input z(t)', 'Simulated Response x(t)');

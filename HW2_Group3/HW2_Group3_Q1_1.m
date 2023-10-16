clc;
clear all;
close all;

a = 2.4832*10^(-5);
mb = 0.02;
g = 9.81;
h_bar = 0.1;
i_bar = sqrt(h_bar^2*mb*g/a);
b0 = -2*a*i_bar/(h_bar^2*mb);
a0 = 2*a*i_bar^2/(h_bar^3*mb);
sys = tf(b0,[1,0,-a0]);


[y,t]=step(sys);

figure
plot(t,y)
grid on;grid minor;
title('Open loop step response of P(s)');
ylabel('Position delta y [m]','Interpreter','latex','FontSize',12)
xlabel('Time [sec]','Interpreter','latex','FontSize',12)
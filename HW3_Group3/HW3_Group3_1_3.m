clc;
clear all;
close all;

m = 10; 
w0 = 2*pi*10;
k1 = 9 * 10^4;
k2 = (9/8) * 10^4;
c = 537.6;
a = k2/c;
b1 = c*(w0^2) /k1;
b2 = (k1 + k2)*(w0^2) / k1;

num1 = c * conv([1, a],[1, 0,w0^2]);
den1 = conv([1, 0], [1, b1 ,b2]);
Q = tf(num1, den1);

s = tf('s');
Tf2x = 1 /( m*s^2 + s * Q);

t = 0:0.01:1; 
[y, t] = step(Tf2x, t);


figure(1);
plot(t, y, 'LineWidth', 2);
grid on;grid minor;

xlabel('Time[sec]');
ylabel('Position z(t)[m]');
title('Step Response of Tf2x');


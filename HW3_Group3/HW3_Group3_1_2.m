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
Tz2x = s*Q /( m*s^2 + s * Q);

opts = bodeoptions;
opts.PhaseVisible = 'off';
bodeplot(Tz2x , opts);
grid on; grid minor;

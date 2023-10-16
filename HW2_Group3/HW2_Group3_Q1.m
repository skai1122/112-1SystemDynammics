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
sys_1 = tf(b0,[1,0,-a0]);

Kp = -500;
Ki = -2000;
Kd = -25;


num = [Kd, Kp, Ki];
den = [1, 0];   
sys_pid = tf(num, den);

sys_2 = series(sys_pid,sys_1);

close_sys = feedback(sys_2,1); 

poles = pole(close_sys);
%[y,t]=step(sys);


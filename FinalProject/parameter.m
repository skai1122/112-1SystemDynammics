clc
clear all
close all

% using data in paper

m1 = 0.7;
m2 = 0.25;
L1 = 0.05;
L2 = 0.08;
J1 = 1.475*10^(-3);
J2 = 1.155*10^(-4);
g = 9.81;

R = 4;
Bm = 10^(-5);
Km = 0.0267;
Jm =3*10^(-5);
L = 5*10^(-3);

simout = sim('model_v2021a.slx');

nonlinear = simout.nonlinear;
linear = simout.linear;
error = simout.error;


figure(1)
plot(nonlinear,'Color','b','LineStyle','--','LineWidth',3);hold on;
plot(linear,'Color','b','LineStyle','-','LineWidth',2);hold on;
grid on; grid minor;

figure(2)
plot(error,'Color','b','LineStyle','-','LineWidth',2);hold on;
grid on; grid minor;

clc; clear all; close all;

Km = 23.2E-3; % [Nm/A]
Ei = 12;      % [V]
Jm = 10.3E-7; % [kgm^2]
Lm = 0.24E-3; % [H]
Rm = 2.32;    % [Ohm]
Bm = 0;       % [Nms/rad]
Td = 0;       % [Nm]

tFinal = 0.1;
simout = sim('motorE2Omega.slx');
simData = simout.motorVel;
t = simData.Time;

figure
plot(t,simData.Data,'linewidth',1.5);
grid on; grid minor;
xlabel('Time [sec]','Interpreter','latex','FontSize',12)
ylabel('Speed [rad/s]','Interpreter','latex','FontSize',12)

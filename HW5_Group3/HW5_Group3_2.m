clc
clear all
close all

global C Cb R1 R2 To

C = 900;
Cb = 4 * 10^4;
R1 = 0.025;
R2 = 0.1;
To = 25;

T_b = To;
T0 = 300; 
tspan = [0 120];


[t, y] = ode45(@ODE, tspan, [T0; T_b]);


figure;
plot(t, y(:, 1), 'b', 'LineWidth', 2);  % T(t)
hold on;
plot(t, y(:, 2), 'r', 'LineWidth', 2); % Tb(t)
xlabel('Time [sec]');
ylabel('Temperature [°C]');
legend('T(t)', 'Tb(t)');
grid on; grid minor;

function dy = ODE(t, y)
    global C Cb R1 R2 To
    dy(1, 1) = (-1 / R1) * (y(1) - y(2)) / C;
    dy(2, 1) = ((1 / R1) * (y(1) - y(2)) / Cb) - ((1 / R2) * (y(2) - To) / Cb);
end

 
    


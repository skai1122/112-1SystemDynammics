clc
clear all
close all

Jm = 2.5*10^-5;
Bm = 1*10^-8;
Km = 0.066;
Rm = 4.8;
r = 6.25;
p = 3*10^-3;
T_f = 0.023;

simout = sim('HW5_Q1_2sim.slx');
simRPM = simout.RPM;
simCurrent = simout.current;
Fload = simout.Fload;
t = simRPM.Time;



figure(1)
set(figure(1),'color',[1 1 1])
set(gcf, 'Position', [50, 50, 1000, 600])

subplot(2,1,1)
plot(Fload,'Color','k','LineStyle','-','LineWidth',2);hold on;
title('$F_{\mathrm{load}}$', 'Interpreter', 'latex', 'FontSize', 15);
grid on;grid minor;
xlim([0 10])
ylim([0 4000])
ylabel('$F_{\mathrm{load}}$ [N]', 'Interpreter', 'latex', 'FontSize', 15)
set(gca,'fontsize',15)

subplot(2,1,2)

yyaxis left
plot(simCurrent,'Color','k','LineStyle','-','LineWidth',2);hold on;
ylabel('Current[A]', 'FontSize', 15,'Color','k')
ylim([0 5])

yyaxis right
plot(simRPM,'Color','r','LineStyle','-','LineWidth',2);
ylabel('Velocity[RPM]', 'FontSize', 15,'Color','r')
%ylim([0 10])
title('Current and Velocity');
grid on; grid minor;
xlim([0 10])
set(gca,'fontsize',15)

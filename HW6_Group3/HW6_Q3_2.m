clc
clear all
close all

simout = sim('HW6_Q3_2sim.slx');

nonlinear_x = simout.non_x;
nonlinear_phi = simout.non_phi;
linear_x = simout.lin_x;
linear_phi = simout.lin_phi;


figure(1)

yyaxis left
plot(nonlinear_phi,'Color','b','LineStyle','--','LineWidth',2);hold on;
plot(linear_phi,'Color','b','LineStyle','-','LineWidth',1);hold on;
ylabel('$\phi$ [rad]', 'Interpreter', 'latex', 'FontSize', 15, 'Color', 'b')
ylim([-0.04 0.1])

yyaxis right
plot(nonlinear_x,'Color','r','LineStyle','--','LineWidth',2);hold on;
plot(linear_x,'Color','r','LineStyle','-','LineWidth',1);hold on;
ylabel('x[m]','Interpreter', 'latex','FontSize', 15,'Color','r')
ylim([-0.2 1.2])
grid on; grid minor;
xlim([0 15])
legend('Nonlinear \phi', 'Linear \phi', 'Nonlinear x', 'Linear x', 'FontSize', 12, 'Location', 'best');
title('Linear and Nonlinear System Analysis');
set(gca,'fontsize',15)

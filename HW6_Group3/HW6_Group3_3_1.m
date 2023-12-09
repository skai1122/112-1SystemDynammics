clc
clear all
close all

simout = sim('HW6_Q3_1slx.slx');

nonlinear_x = simout.non_x;
nonlinear_phi = simout.non_phi;
linear_x = simout.lin_x;
linear_phi = simout.lin_phi;


figure(1)

yyaxis left
plot(nonlinear_phi,'Color','b','LineStyle','--','LineWidth',2);hold on;
plot(linear_phi,'Color','b','LineStyle','-','LineWidth',2);hold on;
ylabel('$\phi$ [rad]', 'Interpreter', 'latex', 'FontSize', 15, 'Color', 'b')
ylim([-2 8])

yyaxis right
plot(nonlinear_x,'Color','r','LineStyle','--','LineWidth',2);hold on;
plot(linear_x,'Color','r','LineStyle','-','LineWidth',2);hold on;
ylabel('x[m]','Interpreter', 'latex','FontSize', 15,'Color','r')
ylim([-2 8])
grid on; grid minor;
xlim([0 10])
legend('Nonlinear \phi', 'Linear \phi', 'Nonlinear x', 'Linear x', 'FontSize', 12, 'Location', 'best');
title('Linear and Nonlinear System Analysis');
set(gca,'fontsize',15)

clc;
clear all;
close all;

load('pendulumData.mat');
[theta, time] = findpeaks(y, t);

zeta = (log(theta(1) / theta(11)) / 10) / sqrt(4 * pi^2 + (log(theta(1) / theta(11)) / 10)^2);
wn = 2*pi/(0.515*sqrt(1-zeta^2));
y0= [y(1),0];

dydt  = @(tlinear,ylinear) [ylinear(2); -2*zeta*wn*ylinear(2)-wn^2*ylinear(1)];    
[tlinear,ylinear] = ode45(dydt,t,y0);

plot(tlinear,ylinear(:,1),'linewidth',2);
hold on;
plot(t,y,'k--','LineWidth',2)
hold on;
grid on;grid minor;
hold off;
legend('Linear Model','Experiment','interpreter','latex','fontsize',12)
ylabel('Position [rad]','Interpreter','latex','FontSize',12)
xlabel('Time [sec]','Interpreter','latex','FontSize',12)
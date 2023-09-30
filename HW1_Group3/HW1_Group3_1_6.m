clc
clear all
close all

tend = 30;
sr = 100;
t = 1:1/sr:tend;
k1 = -64.3;
k2 = -75;
c = -0.08;

anal = zeros(size(t));
anal = k1*(exp(c*(t-1)))+k2*( 1-exp(c*(t-1)) );
sim('problem1sml');

figure(1)
set(figure(1),'color',[1 1 1])
plot(t,anal,'r','linewidth',2);
hold on;
plot(ans.simout.time,ans.simout.data,'b--','linewidth',2);
grid on;
legend('Analytical Solution','Simulink Results','location','best','fontsize',12)
xlim([1 30]);
ylim([-75 -60]);
grid minor;
xlabel('Time(sec)','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('Simulation Result Comparison','fontsize',12)
set(gca,'fontsize',15);
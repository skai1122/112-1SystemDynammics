clc
clear all
close all


time = 300;
p = 1000;
g = 10;
D = 10;
Rf = 100;
h0 = 1;
Q0 = sqrt(p*g*h0)/Rf;

deltaQ1 = 0.1;
deltaQ2 = 1;

c1 = 4/(pi*D^2);
c2 = (4*sqrt(p*g))/(Rf*pi*D^2);
c2bar = c2/(2*sqrt(h0));

deltaQ = deltaQ1;
sim('problem2sml');

figure(1);
plot(ans.linear.time,ans.linear.data,'r','linewidth',2);
hold on;
plot(ans.nonlinear.time,ans.nonlinear.data,'b','linewidth',2);
grid on; 
grid minor;


legend('Linear Solution','Nonlinear Results','location','best','fontsize',12)

xlim([0 300]);
ylim([1 1.2]);
xlabel('Time[s]','fontsize',12);
ylabel('Water Level [m]','fontsize',12);
title(['\deltaQ=0.1'],'fontsize',12);

deltaQ = deltaQ2;
sim('problem2sml');

figure(2);
plot(ans.linear.time,ans.linear.data,'r','linewidth',2);
hold on;
plot(ans.nonlinear.time,ans.nonlinear.data,'b','linewidth',2);
grid on; 
grid minor;


legend('Linear Solution','Nonlinear Results','location','best','fontsize',12)

xlim([0 300]);
ylim([1 3.5]);
xlabel('Time[s]','fontsize',12);
ylabel('Water Level [m]','fontsize',12);
title(['\deltaQ=1.0'],'fontsize',12);





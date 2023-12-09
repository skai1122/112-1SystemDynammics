clc
clear all
close all

Jm = 3*10^-5;
Bm = 1*10^-5;
Km = 3*10^-2;
mb = 1*10^-3;
Jb = 10*10^-5;
Rm = 6;
l = 1*10^-2;
lb = 5*10^-3;
g = 10;

%---- CASE r = 1 -----%
%--m = 1*10^-3 ---%
r = 1;
m = 1*10^-3;
JL=Jb+m*l^2;
KL = (mb*lb+m*l)*g;

sim('HW5_Q1sl.slx');
case1_1 = ans.velocity;
clear r m JL KL ans
%--m = 2*10^-3 ---%
r = 1;
m = 2*10^-3;
JL=Jb+m*l^2;
KL = (mb*lb+m*l)*g;

sim('HW5_Q1sl.slx');
case1_2 = ans.velocity;
clear r m JL KL ans
%---- CASE r = 10 -----%
%--m = 1*10^-3 ---%
r = 10;
m = 1*10^-3;
JL=Jb+m*l^2;
KL = (mb*lb+m*l)*g;

sim('HW5_Q1sl.slx');
case2_1 = ans.velocity;
clear r m JL KL ans
%--m = 2*10^-3 ---%
r = 10;
m = 2*10^-3;
JL=Jb+m*l^2;
KL = (mb*lb+m*l)*g;

sim('HW5_Q1sl.slx');
case2_2 = ans.velocity;
clear r m JL KL ans

figure(1)
set(figure(1),'color',[1 1 1])
set(gcf, 'Position', [50, 50, 1000, 600])

subplot(2,1,1)
plot(case1_1,'Color','k','LineStyle','--','LineWidth',2);hold on;
plot(case1_2,'Color','r','LineStyle','-','LineWidth',1.5);
legend('m = 1 [gram]','m = 10 [gram]','Location','best');
title('Gear Ratio r = 1')
grid on;grid minor;
xlim([0 10])
% ylim([0 4])
ylabel('Velocity[rad/sec]')
set(gca,'fontsize',15)

subplot(2,1,2)
plot(case2_1,'Color','k','LineStyle','--','LineWidth',2);hold on;
plot(case2_2,'Color','r','LineStyle','-','LineWidth',1.5);
title('Gear Ratio r = 10')
grid on;grid minor;
xlim([0 10])
% ylim([0 0.3])
ylabel('Velocity[rad/sec]')
xlabel('Time[sec]')
set(gca,'fontsize',15)


clc; clear all; close all;

%-----------------CASE1-------------------%
M1 = [1 0 0;
     0 1 0;
     0 0 1];
K1 = [1 0 0;
     0 1 -1;
     0 -1 1];
[V1, D1] = eig(K1,-M1);

w_case1_1 = imag(sqrt(D1(1,1)));
w_case1_2 = imag(sqrt(D1(2,2)));
w_case1_3 = imag(sqrt(D1(3,3)));

figure(1)
set(figure(1),'color',[1 1 1])
set(gcf, 'Position', [50, 50, 1000, 700])

subplot(3,1,1)
rectangle("Position",[1+V1(1,2),1,1,1],"LineWidth",1.5,"EdgeColor",'r');hold on;
rectangle("Position",[5+V1(2,2),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[9+V1(3,2),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[1,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');hold on;
rectangle("Position",[5,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
rectangle("Position",[9,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
title('Mode 1')
xlim([1 10])
ylim([1 2.5])
set(gca,'fontsize',15)
axis equal

subplot(3,1,2)
rectangle("Position",[1+V1(1,3),1,1,1],"LineWidth",1.5,"EdgeColor",'r');hold on;
rectangle("Position",[5+V1(2,3),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[9+V1(3,3),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[1,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');hold on;
rectangle("Position",[5,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
rectangle("Position",[9,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
title('Mode 2')
xlim([0 11])
ylim([0.5 2.5])
set(gca,'fontsize',15)
axis equal

subplot(3,1,3)
rectangle("Position",[1+V1(1,1),1,1,1],"LineWidth",1.5,"EdgeColor",'r');hold on;
rectangle("Position",[5+V1(2,1),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[9+V1(3,1),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[1,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');hold on;
rectangle("Position",[5,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
rectangle("Position",[9,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
title('Mode 3')
xlim([1 10])
ylim([1 2.5])
set(gca,'fontsize',15)
axis equal

%-----------------CASE2-------------------%
M2 = [2 0 0;
     0 1 0;
     0 0 1];
K2 = [2 -1 0;
     -1 2 -1;
     0 -1 1];
[V2, D2] = eig(K2,-M2);

w_case2_1 = imag(sqrt(D2(1,1)));
w_case2_2 = imag(sqrt(D2(2,2)));
w_case2_3 = imag(sqrt(D2(3,3)));

figure(2)
set(figure(2),'color',[1 1 1])
set(gcf, 'Position', [50, 50, 1000, 700])

subplot(3,1,1)
rectangle("Position",[1+V2(1,3),1,1,1],"LineWidth",1.5,"EdgeColor",'r');hold on;
rectangle("Position",[5+V2(2,3),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[9+V2(3,3),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[1,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');hold on;
rectangle("Position",[5,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
rectangle("Position",[9,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
title('Mode 1')
xlim([1+V2(1,3) 10])
ylim([1 2])
set(gca,'fontsize',15)
axis equal

subplot(3,1,2)
rectangle("Position",[1+V2(1,2),1,1,1],"LineWidth",1.5,"EdgeColor",'r');hold on;
rectangle("Position",[5+V2(2,2),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[9+V2(3,2),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[1,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');hold on;
rectangle("Position",[5,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
rectangle("Position",[9,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
title('Mode 2')
xlim([1+V2(1,2) 10+V2(3,2)])
ylim([0.5 2.5])
set(gca,'fontsize',15)
axis equal

subplot(3,1,3)
rectangle("Position",[1+V2(1,1),1,1,1],"LineWidth",1.5,"EdgeColor",'r');hold on;
rectangle("Position",[5+V2(2,1),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[9+V2(3,1),1,1,1],"LineWidth",1.5,"EdgeColor",'r');
rectangle("Position",[1,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');hold on;
rectangle("Position",[5,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
rectangle("Position",[9,1,1,1],"LineWidth",2.5,"LineStyle","--","EdgeColor",'k');
title('Mode 3')
xlim([1+V2(1,1) 10])
ylim([1 2])
set(gca,'fontsize',15)
axis equal

s = tf('s');
P1_1 =  [1 0 0]* inv(M2*s^2+K2) *[1;0;0];
P2_2 =  [0 1 0]* inv(M2*s^2+K2) *[0;1;0];

w = logspace(-1,1,1000);
jw = w*1i;

P1_1_jw =  (0.5*(jw).^4 + 1.5*(jw).^2 +0.5)./((jw).^6+4*(jw).^4+3.5*(jw).^2 +0.5);
P2_2_jw =  ((jw).^4 + 2*(jw).^2 +1)./((jw).^6+4*(jw).^4+3.5*(jw).^2 +0.5);


figure(3)
set(figure(3),'color',[1 1 1])
set(gcf, 'Position', [50, 50, 1000, 600])
loglog(w,abs(P1_1_jw),'LineWidth',2);hold on;
loglog(w,abs(P2_2_jw),'LineWidth',2);

grid on; grid minor;
legend('P_1_/_1','P_2_/_2','location','northeast','fontsize',15);

xlabel('Frequency [rad/s]','fontsize',15);
ylabel('Gain [m/N]','fontsize',15)
title('Magnitude plot of P_1_/_1 and P_2_/_2','fontsize',15)
ylim([10^(-4) 10^4])
set(gca,'fontsize',15);





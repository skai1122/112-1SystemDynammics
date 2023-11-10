clc; clear all; close all;

m1 = 10;
m2 = 1;
l1 = 10;
c1 = 0.1;
c2 = 2.5;
k1 = 2000;
g = 10;
j1 = m1*l1^2/3;
w0 = sqrt((k1-m1*g*l1/2)/(j1));
l2 = g/w0^2;
u = [zeros(100,1);ones(50,1);zeros(1350,1)];
t = 0.1*(0:length(u)-1)';


P0 = tf(1 ,[j1 c1 k1-m1*g*l1/2]);
Ps= tf([m2*l2^2 c2 m2*g*l2],...
       [m2*l2^2*j1 ...
        c2*m2*l1^2+c2*j1+c1*m2*l2^2+c2*m2*l2^2-2*c2*m2*l1*l2 ... 
        m2*l2^2*(k1-0.5*m1*g*l1-m2*g*l1)+c1*c2+m2*g*l2*j1+m2^2*g*l2*l1^2  ...
        c2*(k1-0.5*m1*g*l1-m2*g*l1)+m2*g*l2*(c1+c2) ...
        m2*g*l2*(k1-0.5*m1*g*l1-m2*g*l1)]);

w = logspace(0,1,1000);
jw = w*1i;

P0_jW = 1./(j1*(jw).^2+c1*(jw)+(k1-0.5*m1*g*l1));
Ps_jw = (m2*l2^2*(jw).^2+c2*(jw)+(m2*g*l2))./...
        (m2*l2^2*j1*(jw).^4+...
        (c2*m2*l1^2+c2*j1+c1*m2*l2^2+c2*m2*l2^2-2*c2*m2*l1*l2)*(jw).^3+...
        (m2*l2^2*(k1-0.5*m1*g*l1-m2*g*l1)+c1*c2+m2*g*l2*j1+m2^2*g*l2*l1^2)*(jw).^2+...
        (c2*(k1-0.5*m1*g*l1-m2*g*l1)+m2*g*l2*(c1+c2))*(jw)+...
        (m2*g*l2*(k1-0.5*m1*g*l1-m2*g*l1)));

Y_0 = lsim(P0,u,t);
Y = lsim(Ps,u,t);

figure(1)
plot(t,Y_0,'LineWidth',1.5,'Color','b');hold on;
plot(t,Y,'LineWidth',1.5,'Color','r');
legend('Response of P_0','Response of P','location','northeast','fontsize',15);
xlim([0 150])
ylim([-1.5*10^-3 1.5*10^-3])
xlabel('Time[sec]')
ylabel('Amplitude[rad]')
set(gca,'fontsize',15)
grid minor;


figure(2)
loglog(w,abs(P0_jW),'LineWidth',2);hold on;
loglog(w,abs(Ps_jw),'LineWidth',2);

legend('|P_0(jw)|','|P(jw)|','location','northeast','fontsize',15);
xlabel('Frequency [rad/s]','fontsize',15);
ylabel('Gain [m/N]','fontsize',15)
grid on; grid minor;
set(gca,'fontsize',15);





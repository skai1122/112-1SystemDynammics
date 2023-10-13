clc
clear all 
close all

x0 = 0.75; 
T = 0.05; 
tFinal = 2; 
t = [0:T:tFinal];
a=10;
b=10;
omega=10;

xh=x0*exp(-a*t);
xp=zeros(size(xh));
tk=0;

for k=1:length(t)
    func=@(tau) exp(-a.*(tk-tau)).*b.*(1+sin(omega.*tau));
    xp(k)=integral(func,0,tk);
    tk=tk+T;
end

x = zeros(size(t));
x(1) = x0; 
tk = 0;

for k = 1:length(t)-1
    fk = -a.*x(k)+b.*(1+sin(omega.*tk));
    x(k+1) = x(k) + fk*T;
    tk = tk + T;
end

figure;
subplot(211)
plot(t,xh+xp,'LineWidth',1); hold on;
plot(t,x,'-o','markersize',5,'LineWidth',1); hold on;
legend('Analytical Solution','Numerical Integration',...
       'interpreter','latex','fontsize',12,'location','best');
title('Rectagular method','Interpreter','latex','FontSize',12)
grid on; grid minor;
ylabel('Amplitude [-]','Interpreter','latex','FontSize',12)
subplot(212)
stem(t,xh+xp-x,'m','LineWidth',1)
grid on; grid minor;
ylabel('Error [-]','Interpreter','latex','FontSize',12)
xlabel('Time [s]','Interpreter','latex','FontSize',12)
set(gcf, 'Position', [50, 50, 400, 400])
clc; clear all; close all; 

% parameters
r = 0.001;  rho = 2707;
L = 0.01;   k = 220;
Ta = 25;    cp = 896;
Tb = 100;   hc = 20;

% single LPM
Ak = pi*r^2;
Ac = 2*pi*r*L + Ak;
Ch = rho * cp * (L*Ak);
Rk = 0.5*L / (k*Ak);
Rc = 1/ (hc*Ac);

% simulated response
A_SLPM   = -(1/Rk + 1/Rc)/Ch;
B_SLPM   = 1;
C_SLPM   = 1;
D_SLPM   = 0;
sys_SLPM = ss(A_SLPM,B_SLPM,C_SLPM,D_SLPM);
t = [0:0.01:3].';

u_SLPM   = (Tb/Rk + Ta/Rc)/Ch * ones(size(t));
T0_SLPM  = Ta;
Tx_SLPM = lsim(sys_SLPM,u_SLPM,t,T0_SLPM);

figure(1)
plot(t,Tx_SLPM,'LineWidth',2); hold on;
grid on; grid minor;
xlabel('Time [sec]','Interpreter','latex','FontSize',12);
ylabel('Temperature [$^{\circ}$C]','Interpreter','latex','FontSize',12);

% multiple LPM
n   = 3;
Ch  = rho * cp * (L*Ak)/n;
Rk0 = 0.5*(L/n) / (k*Ak);
Rk  = (L/n) / (k*Ak);
Rc  = 1/(hc*2*pi*r*L/n);
Rc0 = 1/(hc*pi*r^2);

A_MLPM = zeros(3,3);
B_MLPM = zeros(3,2);
C_MLPM = eye(3);
D_MLPM = zeros(3,2);

A_MLPM(1,1) = -(1/Rk0 + 1/Rk + 1/Rc);
A_MLPM(1,2) = 1/Rk;
A_MLPM(2,1) = 1/Rk;
A_MLPM(2,2) = -(2/Rk + 1/Rc);
A_MLPM(2,3) = 1/Rk;
A_MLPM(3,2) = 1/Rk;
A_MLPM(3,3) = -(1/Rk+1/Rc+1/Rc0);
A_MLPM = (1/Ch) * A_MLPM;

B_MLPM(1,1) = 1/Rk0;
B_MLPM(1,2) = 1/Rc;
B_MLPM(2,2) = 1/Rc;
B_MLPM(3,2) = 1/Rc + 1/Rc0;
B_MLPM = (1/Ch) * B_MLPM;

sys_MLPM = ss(A_MLPM,B_MLPM,C_MLPM,D_MLPM);
u_MLPM = [Tb*ones(size(t)),Ta*ones(size(t))];
T0_MLPM = Ta * ones(n,1);
Tx_MLPM = lsim(sys_MLPM,u_MLPM,t,T0_MLPM);

figure(2)
plot(t,Tx_MLPM,'LineWidth',2); hold on;
grid on; grid minor;
legend('$T_1$','$T_2$','$T_3$','Interpreter','latex','fontsize',12,'location','best');
xlabel('Time [sec]','Interpreter','latex','fontsize',12);
ylabel('Temperature [$^{\circ}$C]','Interpreter','latex','fontsize',12);

% spatial distribution
figure(3)
j = 1; str = {};
for timeIndex = [1,5,10,50,100,300];
    plot(Tx_MLPM(timeIndex,:),'-o','LineWidth',2); hold on;
    str{j} = ['$t=$',num2str(timeIndex*0.01),'s'];
    j = j + 1;
end
grid on; grid minor;
xticks([1,2,3])
xticklabels({'T_1','T_2','T_3'});
ylabel('Temperature [$^{\circ}$C]','Interpreter','latex','fontsize',12);
legend(str,'Interpreter','latex','fontsize',12);

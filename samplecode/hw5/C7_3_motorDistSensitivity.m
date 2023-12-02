clc; clear all; close all;


%% set up simulation
% model parameters
Km = 0.20;
Jm = 0.001;
Rm = 20;

% disturbance
Td = 0.01; t_Td = 5;

% controller gain
Kv = 5; Kw = (Km^2 + Km*Kv)/Km;

tFinal = 10;
simout = sim('motorDistSenSim.slx');
simData = simout.motorResp;
t = simData.Time;
yOL = simData.Data(:,1); maxY = max(yOL);
yCL = simData.Data(:,2);

figure;
plot(t,yOL,'LineWidth',1); hold on;
plot(t,yCL,'LineWidth',1); hold on;
plot(t_Td*[1,1],[0,maxY],'k--','LineWidth',1);
text(t_Td,0.5*maxY,'Inject Dist. $\rightarrow$','HorizontalAlignment','right',...
    'Interpreter','latex','FontSize',12)
grid on; grid minor;
xlabel('Time [sec]','Interpreter','latex','FontSize',12)
ylabel('Speed [rad/s]','Interpreter','latex','FontSize',12)
legend('Open-Loop Resp.','Closed-Loop Resp.',...
       'interpreter','latex','fontsize',12,'location','best');
ylim([0,11])
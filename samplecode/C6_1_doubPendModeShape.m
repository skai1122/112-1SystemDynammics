clc; clear all; close all;


%% compute eigenvalues and eigenvectors
M = [6 2;2 2];
K = diag([30,10]);
a1 = 1; a2 = 1;

[V,D] = eig(K,-M);
w1 = imag(sqrt(D(1,1)));
w2 = imag(sqrt(D(2,2)));

% plot mode shapes
figure
colorOrder = get(gca,'colororder');
subplot(121)
for theta1 = linspace(-0.5,0.5,11)
    theta2 = theta1*V(2,1)/V(1,1);
    x1 = a1*sin(theta1);      y1 = -a1*cos(theta1);
    x2 = x1 + a2*sin(theta2); y2 = y1 - a2*cos(theta2);
    plot([0,x1],[0,y1],'color',colorOrder(1,:),'LineWidth',1); hold on;
    plot([x1,x2],[y1,y2],'color',colorOrder(2,:),'LineWidth',1); hold on;
end
title(['Mode 1: $\omega_1=$',num2str(w1,2)],'Interpreter','latex','FontSize',12)

subplot(122)
for theta1 = linspace(-0.5,0.5,11)
    theta2 = theta1*V(2,2)/V(1,2);
    x1 = a1*sin(theta1);      y1 = -a1*cos(theta1);
    x2 = x1 + a2*sin(theta2); y2 = y1 - a2*cos(theta2);
    plot([0,x1],[0,y1],'color',colorOrder(1,:),'LineWidth',1); hold on;
    plot([x1,x2],[y1,y2],'color',colorOrder(2,:),'LineWidth',1); hold on;
end
title(['Mode 1: $\omega_2=$',num2str(w2,2)],'Interpreter','latex','FontSize',12)

set(gcf, 'Position', [50, 50, 600, 300])


%% linear simulation
Kbar = inv(M)*K;
Bbar = inv(M)*[1;0];
A = [0 0 1 0;
     0 0 0 1;
    -Kbar,zeros(2,2)];
B = [Bbar;
     0; 0];
C = [1 0 0 0;
     0 1 0 0];
D = zeros(2,1);

% only valid for small q0
% q0 = [0.2;0.2*sqrt(3);0;0];
q0 = 0.2*[1;sqrt(3);0;0];
tFinal = 10
[q,t] = initial(ss(A,B,C,D),q0,tFinal);

figure

for k = 1:length(t)
    x1 = a1*sin(q(k,1));      y1 = -a1*cos(q(k,1));
    x2 = x1 + a2*sin(q(k,2)); y2 = y1 - a2*cos(q(k,2));
    plot([0,x1],[0,y1],'color',colorOrder(1,:),'LineWidth',2); hold on;
    plot([x1,x2],[y1,y2],'color',colorOrder(2,:),'LineWidth',2); hold off;

    xlim([-1 1]); ylim([-2.5,0.5]);
    pause(0.1)
end




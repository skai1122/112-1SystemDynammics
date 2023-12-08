clc; clear all; close all;

%----------case1--------------%

%% phase portrait
x1 = linspace(-4.0,4.0,10);
x2 = linspace(-4.0,4.0,10);
[X1 X2] = meshgrid(x1,x2);

x1dot = -X2 -(3/2)*(X1.^2)-(1/2)*(X1.^3);
x2dot = 3*X1 - X2;

f = @(t,X) [-X(2)-(3/2)*(X(1)^2)-(1/2)*(X(1)^3);
             3*X(1)-X(2)];

figure('Position', [100, 100, 800, 600]);

% plot velocity field
quiver(X1,X2,x1dot,x2dot,'b','LineWidth',1); hold on;


% solution curves
for k = 1:3:length(x1),
    for kk = 1:3:length(x2),
        [t,x] = ode45(f,[0 10],[x1(k) x2(kk)]);
        plot(x(:,1),x(:,2),'g','linewidth',1); hold on;     
    end
end


fLin1 = @(t,X) [-X(2);
                3*X(1)-X(2)];
for x1_0 = -1:1:1
    for x2_0 = -1:1:1
        [t,x] = ode45(fLin1,[0 10],[x1_0 x2_0]);
         plot(x(:,1),x(:,2),'k','linewidth',1); hold on;
    end
end

plot(0,0,'rx','linewidth',1); hold on;

grid on; grid minor;
axis([-4 4 -4 4])
xlabel('$x_1$','interpreter','latex','fontsize',12);
ylabel('$x_2$','interpreter','latex','fontsize',12);




%----------case2--------------%
x1 = linspace(-4.0,4.0,10);
x2 = linspace(-4.0,4.0,10);
[X1 X2] = meshgrid(x1,x2);

x1dot = -X2 -(3/2)*(X1.^2)-(1/2)*(X1.^3)-1.0376;
x2dot = 3*X1 - X2;

f = @(t,X) [-X(2)-(3/2)*(X(1)^2)-(1/2)*(X(1)^3)-1.0376;
             3*X(1)-X(2)];

figure('Position', [100, 100, 800, 600]);

% plot velocity field
quiver(X1,X2,x1dot,x2dot,'b','LineWidth',1); hold on;


% solution curves
for k = 1:3:length(x1),
    for kk = 1:3:length(x2),
        [t,x] = ode45(f,[0 10],[x1(k) x2(kk)]);
        plot(x(:,1),x(:,2),'g','linewidth',1); hold on;     
    end
end


fLin2 = @(t,X) [0.999*X(1)-X(2)-1.0376;
                3*X(1)-X(2)];

for x1_0 = -1:0.5:0
    for x2_0 = -1:0.5:0
        [t,x] = ode45(fLin2,[0 5],[x1_0 x2_0]);
         plot(x(:,1),x(:,2),'k','linewidth',1); hold on;
    end
end

plot(-0.422,-1.266,'rx','linewidth',1); hold on;

grid on; grid minor;
axis([-4 4 -4 4])
xlabel('$x_1$','interpreter','latex','fontsize',12);
ylabel('$x_2$','interpreter','latex','fontsize',12);


clc; clear all; close all;


%% phase portrait
x1 = linspace(-2.0,5.0,21);
x2 = linspace(-3.5,3.5,21);
[X1 X2] = meshgrid(x1,x2);

x1dot =  X2;
x2dot = -0.3*X2 - sin(X1);

f = @(t,X) [ X(2);
            -sin( X(1) ) - 0.3*X(2) ];

figure

% plot velocity field
quiver(X1,X2,x1dot,x2dot,'b','LineWidth',1); hold on;

% solution curves
for k = 1:3:length(x1),
    for kk = 1:3:length(x2),
        [t,x] = ode45(f,[0 10],[x1(k) x2(kk)]);
         plot(x(:,1),x(:,2),'g','linewidth',1); hold on;
    end
end


%% linearized system at (k*2*pi,0)
fLin1 = @(t,X) [ X(2);
                -X(1) - 0.3*X(2)];
plot(0,0,'rx','linewidth',1); hold on;

% solution curves
for x1_0 = -1:1:1,
    for x2_0 = -1:1:1,
        [t,x] = ode45(fLin1,[0 10],[x1_0 x2_0]);
         plot(x(:,1),x(:,2),'k','linewidth',1); hold on;
    end
end


%% linearized system at (k*2*pi+pi,0)
fLin2 = @(t,X) [ X(2);
                 X(1) - 0.3*X(2) ];
plot(pi,0,'rx','linewidth',1); hold on;

% solution curves
for x1_0 = -1:0.5:1,
    for x2_0 = -1:0.5:1,
        [t,x] = ode45(fLin2,[0 10],[x1_0 x2_0]);
         plot(pi + x(:,1),x(:,2),'k','linewidth',1); hold on;
    end
end

axis square
grid on; grid minor;
axis([-2 5 -3.5 3.5])
xlabel('$x_1$','interpreter','latex','fontsize',12);
ylabel('$x_2$','interpreter','latex','fontsize',12);
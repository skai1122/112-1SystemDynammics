clc; clear all; close all;


%% phase portrait
x1 = linspace(-1,1,21);
x2 = linspace(-1,1,21);
[X1 X2] = meshgrid(x1,x2);

x1dot = X2 - X1 .* (X1.^2 + X2.^2);
x2dot =-X1 - X2 .* (X1.^2 + X2.^2);

f = @(t,X) [ X(2) - X(1) * ( X(1)^2 + X(2)^2 );
            -X(1) - X(2) * ( X(1)^2 + X(2)^2 ) ];

flin = @(t,X) [ X(2);
               -X(1)];

figure

% vector field
quiver(X1,X2,x1dot,x2dot); hold on;

% solution curves
for k = 1:4:length(x1),
    for kk = 1:4:length(x2),
        [t,x] = ode45(f,[0 5],[x1(k) x2(kk)]);
         plot(x(:,1),x(:,2),'g','linewidth',1); hold on;
        [~,xlin] = ode45(flin,[0 5],[x1(k) x2(kk)]);
        plot(xlin(:,1),xlin(:,2),'k','linewidth',1); hold on;
    end
end

axis equal
axis([-1 1 -1 1]);
grid on; grid minor;
xlabel('$x_1$','interpreter','latex','fontsize',12);
ylabel('$x_2$','interpreter','latex','fontsize',12);
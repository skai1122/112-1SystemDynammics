clc; clear all; close all;

%----------initialize-----------%
A = cell(1, 3);
A{1} = [3 -2; 2 -2];
A{2} = [-3/4 1/2; 1/8 -3/4];
A{3} = [-1 -4; 1 -1];

Xi = cell(1, 3);
xi1 = cell(1, 5);
xi1{1}=[-1.1 -2];xi1{2}=[0.9 2];xi1{3}=[-0.5 2];xi1{4}=[0.5 -2];xi1{5}=[1.1 2];
xi2 = cell(1, 6);
xi2{1}=[-2 -2];xi2{2}=[-2 0];xi2{3}=[-0.5 2];xi2{4}=[-1 -2];xi2{5}=[2 0];xi2{6}=[2 -2];
xi3 = cell(1, 4);
xi3{1}=[2 2];xi3{2}=[-2 -2];xi3{3}=[-2 -1];xi3{4}=[2 0];

Xi{1} = xi1;
Xi{2} = xi2;
Xi{3} = xi3;
%----------------------------------%          

x1 = linspace(-2,2,11);
x2 = linspace(-2,2,11);
[X1 X2] = meshgrid(x1,x2);

for i = 1:3
    x1dot = A{i}(1,1)*X1 +A{i}(1,2)*X2;
    x2dot = A{i}(2,1)*X1 + A{i}(2,2)*X2;

    [V, D] = eig(A{i});
 
    % plot velocity field (a)
    figure(i)
    grid on; grid minor;
    quiver(X1,X2,x1dot,x2dot,'b','LineWidth',1); hold on
    xlim([-2 2]);
    ylim([-2 2]);
    xlabel('x1');
    ylabel('x2');
    grid on; grid minor;
    title(['A_', num2str(i)], 'FontSize', 14);
    
    % if the eigenvalues of A are real, plot eigenvectors.(b)
    if isreal(D)
        for j = 1:2
            plot([0, V(1, j)], [0, V(2, j)], 'r', 'LineWidth', 2);hold on  % Plot lines specified by eigenvectors
        end
    end
    
    % plot trajectories of the differential equation using the initial conditions
    f = @(t,X) [ A{i}(1,1)*X(1) + A{i}(1,2)*X(2);
                 A{i}(2,1)*X(1) + A{i}(2,2)*X(2)];


    for kk = 1:length(Xi{i})
        [t,x] = ode45(f,[0 20],Xi{i}{kk});
        plot(x(:,1),x(:,2),'g','linewidth',2);hold on
    end

    %Classify the origin (the equilibrium point x1(t) = x2(t) = 0) as stable or unstable.
    real_part = real(diag(D));

    if all(real_part < 0)
        text(0, 0, 'Stable', 'HorizontalSAlignment', 'center', 'FontSize', 12);
    else
        text(0, 0, 'Unstable', 'HorizontalAlignment', 'center', 'FontSize', 12);
    end
 
end


x0 = transpose([2 2]);
t = 0:0.1:10;
x = zeros(2, length(t));

for t_index = 1:length(t)
    x(:, t_index) = expm(A{3} * t(t_index)) * x0;
end
figure(4);
plot(t, x(1,:), t, x(2,:));hold on;
xlabel('Time');
ylabel('Value');
ylim([-2 2]);
legend('x_1', 'x_2');
grid on;


x_1 = 2 * exp(-t) .* cos(2 * t) - 4 * exp(-t) .* sin(2 * t);
x_2 = 2 * exp(-t) .* cos(2 * t) - exp(-t) .* sin(2 * t);
figure(5);
plot(t, x_1, 'LineWidth', 2);
hold on;
plot(t, x_2, 'LineWidth', 2);
xlabel('Time');
ylabel('Value');
title('Plot of x_1 and x_2 over Time');
legend('x_1', 'x_2');
grid on;






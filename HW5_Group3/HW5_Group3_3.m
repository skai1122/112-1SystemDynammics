clc; clear all; close all; 

I = 1.563*10^(-10);  
rho = 2800; L = 0.3;   
E = 70*10^9; A = 7.5*10^(-5);   

num = [4, 12, 36];

for i = 1:3
    M0 = [1, 0, 0, 0;
         0, (L/num(i))^2/12, 0, 0;
         0, 0, 1, 0;
         0, 0, 0, (L/num(i))^2/12];
    M0 = M0*(rho*A*(L/num(i))/2);

    K0 = [12,         6*(L/num(i)),   -12,         6*(L/num(i));
         6*(L/num(i)), 4*(L/num(i))^2, -6*(L/num(i)), 2*(L/num(i))^2;
         -12,       -6*(L/num(i)),   12,         -6*(L/num(i));
         6*(L/num(i)), 2*(L/num(i))^2, -6*(L/num(i)), 4*(L/num(i))^2];
    K0 = K0*(E*I/(L/num(i))^3); 

    l = zeros(1,num(i)+1);
    for k = 2:num(i)+1
        l(k) = l(k-1)+L/num(i);     
    end
    
    n = (num(i)+1)*2; 
    M = zeros(n,n);
    K = zeros(n,n);
    p = 1;
    for j = 1:num(i)
        M(p:p+3,p:p+3) = M(p:p+3,p:p+3) + M0;
        K(p:p+3,p:p+3) = K(p:p+3,p:p+3) + K0;
        p = p + 2;
    end
    M = M(3:n,3:n);
    K = K(3:n,3:n);
    
    [V,lambda] = eig(K,-M,'vector');
    w = sqrt(-lambda);
    V = transpose(V);
    mode = zeros(4,num(i)+1);
    mode(1:4,2:num(i)+1) = V(n-5:n-2, 1:2:end);
    
 
    % for m = 1:4
    %     if max((mode(m,1:num(i)+1)))<= abs(min((mode(m,1:num(i)+1)))) || max((mode(m,1:num(i)+1))) <= 0
    %         mode(m,1:num(i)+1) = mode(m,1:num(i)+1)/min((mode(m,1:num(i)+1)));
    %     else
    %         mode(m,1:num(i)+1) = mode(m,1:num(i)+1)/max((mode(m,1:num(i)+1)));
    %     end
    % end
     if i== 1
        mode(1,1:num(i)+1) = mode(1,1:num(i)+1)/mode(1,2);
        mode(2,1:num(i)+1) = mode(2,1:num(i)+1)/mode(2,2);
        mode(3,1:num(i)+1) = -mode(3,1:num(i)+1)/mode(3,5);
        mode(4,1:num(i)+1) = mode(4,1:num(i)+1)/mode(4,5);
    elseif i == 2
        mode(1,1:num(i)+1) = -mode(1,1:num(i)+1)/mode(1,13);
        mode(2,1:num(i)+1) = mode(2,1:num(i)+1)/mode(2,13);
        mode(3,1:num(i)+1) = -mode(3,1:num(i)+1)/mode(3,13);
        mode(4,1:num(i)+1) = mode(4,1:num(i)+1)/mode(4,13);
    elseif i ==3
        mode(1,1:num(i)+1) = -mode(1,1:num(i)+1)/mode(1,37);
        mode(2,1:num(i)+1) = mode(2,1:num(i)+1)/mode(2,37);
        mode(3,1:num(i)+1) = -mode(3,1:num(i)+1)/mode(3,37);
        mode(4,1:num(i)+1) = mode(4,1:num(i)+1)/mode(4,37);
    end
    
 
    figure(i);
    plot(l(:), mode(4,:), 'LineWidth', 3, 'Color', [0 0.4470 0.7410], 'LineStyle', '-', 'Marker', 'O', 'DisplayName', ['Mode 1: \omega = ' num2str(w(n-2))]); hold on;
    plot(l(:), mode(3,:), 'LineWidth', 3, 'Color', [0.8350 0.0780 0.1840], 'LineStyle', '-.', 'Marker', 'square', 'DisplayName', ['Mode 2: \omega = ' num2str(w(n-3))]); hold on;
    plot(l(:), mode(2,:), 'LineWidth', 3, 'Color', [0.9290 0.6940 0.1250], 'LineStyle', '--', 'Marker', '^', 'DisplayName', ['Mode 3: \omega = ' num2str(w(n-4))]); hold on;
    plot(l(:), mode(1,:), 'LineWidth', 3, 'Color', [0.4940 0.1840 0.5560], 'LineStyle', ':', 'Marker', 'v', 'DisplayName', ['Mode 4: \omega = ' num2str(w(n-5))]); hold on;

        
    ylabel('Amplitude [-]', 'FontSize', 16);
    xlabel('Position [m]', 'FontSize', 16);
    xlim([0,0.3]);
    ylim([-1,1]);
    legend('Location', 'southwest', 'FontSize', 9);
    grid on;
    grid minor;   
end


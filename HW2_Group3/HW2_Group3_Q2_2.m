clc;
clear all;
close all;

%% frequency response
DampingRatios = [0.3, 0.5, 1.0]; 
k = 50;

% generate grid points
w = logspace(-2, 3, 100);

figure(1)

for i = 1:length(DampingRatios)
    DampingRatio = DampingRatios(i);
    c = sqrt(50) * 2 * DampingRatio;

    % compute by definition
    H_jw = (k + 1i * c .* w) ./ (-w.^2 +  1i * c .* w + k);

    loglog(w, abs(H_jw), 'LineWidth', 2);
    hold on;
end

grid on;
grid minor;
ylabel('Magnitude', 'interpreter', 'latex', 'fontsize', 12);
xlabel('Frequency [rad/s]', 'interpreter', 'latex', 'fontsize', 12);
legend('DampingRatio = 0.3', 'DampingRatio = 0.5', 'DampingRatio = 1.0');


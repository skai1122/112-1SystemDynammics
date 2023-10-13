clc; clear all; close all;


%% frequency response
a1 = 2; a2 = 2;
b1 = 2; b2 = 2;

% generate grid points
w = logspace(-2,2,50);

% compute by definition
H_jw = (b2 + i*b1.*w) ./ (a2-w.^2+i*a1.*w);

figure
subplot(211)
loglog(w,abs(H_jw),'LineWidth',2); hold on;
grid on; grid minor;
ylabel('Magnitude','interpreter','latex','fontsize',12)
subplot(212)
semilogx(w,rad2deg(angle(H_jw)),'LineWidth',2); hold on;
grid on; grid minor;
xlabel('Frequency [rad/s]','interpreter','latex','fontsize',12);
ylabel('Angle [deg]','interpreter','latex','fontsize',12)
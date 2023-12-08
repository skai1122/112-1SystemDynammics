clc; clear all; close all;


%% analytical solution
Len     = 0.3;
modulus = 70E9;
inertia = 1.563E-10;
rho     = 2800;
area    = 0.015*0.005;

% fixed-free B.C. mode shapes
beta1 =  1.875104/Len;
beta2 =  4.694091/Len;
beta3 =  7.854757/Len;
beta4 = 10.995541/Len;

omega_theory = sqrt((modulus*inertia)/(rho*area))*...
              [beta1^2; beta2^2; beta3^2; beta4^2];

alpha1 = ( sin(beta1*Len)+sinh(beta1*Len) )/( cos(beta1*Len)+cosh(beta1*Len) );
alpha2 = ( sin(beta2*Len)+sinh(beta2*Len) )/( cos(beta2*Len)+cosh(beta2*Len) );
alpha3 = ( sin(beta3*Len)+sinh(beta3*Len) )/( cos(beta3*Len)+cosh(beta3*Len) );
alpha4 = ( sin(beta4*Len)+sinh(beta4*Len) )/( cos(beta4*Len)+cosh(beta4*Len) );

% mode shapes
x  = linspace(0,Len,50);
w1 = sin(beta1*x)-sinh(beta1*x) - alpha1*( cos(beta1*x)-cosh(beta1*x) );
w2 = sin(beta2*x)-sinh(beta2*x) - alpha2*( cos(beta2*x)-cosh(beta2*x) );
w3 = sin(beta3*x)-sinh(beta3*x) - alpha3*( cos(beta3*x)-cosh(beta3*x) );
w4 = sin(beta4*x)-sinh(beta4*x) - alpha4*( cos(beta4*x)-cosh(beta4*x) );

% normalization
w1 = w1/max(abs(w1));
w2 = w2/max(abs(w2));
w3 = w3/max(abs(w3));
w4 = w4/max(abs(w4));

figure
plot(x,w1,'-', 'linewidth',2.0); hold on;
plot(x,w2,'-.','linewidth',2.0); hold on;
plot(x,w3,'--','linewidth',2.0); hold on;
plot(x,w4,':', 'linewidth',2.0); hold on;
grid on; grid minor;
legend(['Mode 1: $\omega$=',num2str(omega_theory(1),2)],...
       ['Mode 2: $\omega$=',num2str(omega_theory(2),2)],...
       ['Mode 3: $\omega$=',num2str(omega_theory(3),2)],...
       ['Mode 4: $\omega$=',num2str(omega_theory(4),2)],...
        'interpreter','latex','fontsize',12,'location','southwest')
xlabel('Position [m]','interpreter','latex','fontsize',12)
ylabel('Amplitude [-]','interpreter','latex','fontsize',12)
set(gcf, 'Position', [100, 100, 600, 300])



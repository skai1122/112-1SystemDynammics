clc; clear all; close all; 


I = 1.563*10^(-10);  
rho = 2800; L = 0.3;   
E = 70*10^9; A = 7.5*10^(-5);   

l = [L/4 , L/12 , L/36];

i = 1;

M =(rho*A*(l(i)/2))* [1, 0, 0, 0;
                     0, (l(i)^2)/12, 0, 0;
                     0, 0, 1, 0;
                     0, 0, 0, (l(i)^2)/12];


K = [12,         6*(L/l(i)),   -12,         6*(L/l(i));
     6*(L/l(i)), 4*(L/l(i))^2, -6*(L/l(i)), 2*(L/l(i))^2;
     -12,       -6*(L/l(i)),   12,         -6*(L/l(i));
     6*(L/l(i)), 2*(L/l(i))^2, -6*(L/l(i)), 4*(L/l(i))^2];
 
K = K*(E*I/(L/l(i))^3);
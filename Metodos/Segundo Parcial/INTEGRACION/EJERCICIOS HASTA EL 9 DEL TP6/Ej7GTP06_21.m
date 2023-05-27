# Ej7TP06.m
% Ej7GTP06_21.m
clear all;
clc;

x = [0:200:1200];
rho =[4 3.95 3.89 3.8 3.6 3.41 3.3];
Ac = [100 103 106 110 120 133 149.6];
rhoKg = rho/1000;
I = rhoKg.*Ac;
y = I;
disp('Calculo con Regla Trapecio')
W_trap = trapcomp(x,y)

W_Simp = simpsoncomp(x,y)
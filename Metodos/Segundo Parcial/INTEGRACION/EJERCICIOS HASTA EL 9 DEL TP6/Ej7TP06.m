# Ej7TP06
clear all;
clc;

x = [0:200:1200];
n=length(x);
rho =[4 3.95 3.89 3.8 3.6 3.41 3.3];
Ac = [100 103 106 110 120 133 149.6];
rhoKg = rho/1000;
I = rhoKg.*Ac;
y = I;
disp('===========================')
disp('Calculo con Simpson')
[S] = SimpsonCompuestoDatos(x,y);
W_S=S

disp('===========================')
[PL, L] = Lagrange(x,y);
%PL=polyfit(x,y,n-1);
plag = @(x) polyval(PL,x);

W_Spol = SimpsonCompuesto(plag,x(1),x(n),n-1)
ErrSimp=abs(W_Spol-W_S)

disp('===========================')
disp('calculo con Trapezoidal')
I = TrapzCompDatos(x,y)

disp('===========================')
disp('Valor Octave con trapz')
W_Octave = trapz(x,y)

ErrTrap = abs(W_Octave-I)


 

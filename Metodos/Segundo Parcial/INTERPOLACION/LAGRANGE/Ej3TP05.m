# Ejercicio 3 GTP 5
# script: Ej3TP05.m
% Nuevo Guia Ej2TP05
clear all; clc; clf

x = [3 5 7 9]'
y = [1.2 1.7 2.0 2.1]'

PL = @(x) (-1/40)*x.^2 + (9/20)*x + (3/40);

PN = @(x) (-0.025)*x.^2+(9/20)*x + (3/40);

PCI = @(x) 0.075 +0.45*x -0.025*x.^2;

%PL = PL(x);
figure(1)
plot(x,y,'*r')
grid on; grid minor;
hold on
% graficado con la funcion ezplot
ezplot(PL,[3,9])
ezplot(PN,[3,9])
ezplot(PCI,[3,9])

% graficado con la funcion plot

%z=linspace(3,9,201);
%PL=PL(z);
%PN=PN(z);
%PCI=PCI(z);

%plot(z,PL,'b-',z,PN,'m-',z,PCI,'g-')

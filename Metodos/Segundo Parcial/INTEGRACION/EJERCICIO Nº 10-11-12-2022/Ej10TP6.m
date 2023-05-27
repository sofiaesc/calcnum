%DATOS Ej10TP6
clear all
clc
% Ejercicio Nº 10 de la Guia TP06 2021- El area de la superficie de revolucion
% fue calculada haciendo girar la función f(x) alrededor del eje X
% F: es el integrando. 

%====================================
%f = @(x) 20*x - (x.^3)/5;
%df = @(x) 20 - 3*(x.^2)/5;
%====================================
f = @(x) 2.5 + x.*cos(2*x);
df = @(x) cos(2*x) -2*x.*sin(2*x);
%====================================

% Area de revolucion
F = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);
x=linspace(0,2,20);
disp('============================================')
disp('Datos del Problema')
a = 0 
b = 2 
L=10 
n=3

%RESOLUCION
%Simpson Compuesto
disp('============================================')
disp('Calculo con Simpson Compuesta')
Sc = simp_comp(F,a,b,L)


%Trapecio Compuesto
disp('============================================')
disp('Calculo con Trapezoidal Compuesta')
Tc = trap_comp(F,a,b,L+5)

%Regla de Simpson
disp('============================================')
disp('Calculo con Simpson')
S = simpson(F,a,b)
%Cuadratura de Gauss con n = 3

disp('============================================')
disp('Calculo con Cuadratura de Gauss')
Q=cuad_gauss_c(F,a,b,L,n)

disp('============================================')
disp('Calculo con cuadratura de Octave funcion quad')

%Funcion quad de octave
q = quad(F,a,b)

disp('============================================')
disp('Figura 1: Grafica de la funcion f(x)')
figure(1)
fx=f(x);
plot(x,fx,'b-')
grid on
grid minor

disp('============================================')
disp('Figura 2: Grafica de la funcion f(x) rotada alrededor de X')
figure(2)
% Corremos la funcion para graficar
graficaEj10

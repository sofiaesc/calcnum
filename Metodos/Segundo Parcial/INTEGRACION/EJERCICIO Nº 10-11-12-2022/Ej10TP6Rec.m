%DATOS Ej10TP6Rec
clear all
clc

f = @(x) 1 + x + cos(x);
df = @(x) 1 - sin(x);
F = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);
ft = @(t) t + 1;
a = 0; b = 4; M = 10;
%RESOLUCION
%simpson compuesto
sc = simp_comp(F,a,b,M)
%trapecio compuesto
tc = trap_comp(F,a,b,M+5)
%regla de simpson
s = simpson(F,a,b)
%cuadratura de gauss con n = 3
g = gauss(F,ft,a,b)
%funcion quad de octave
q = quad(F,a,b)


graficaEj10
#TestPoly.m
clear all; clc; clf
# función a usar:
%f = @(x) sin(2*pi*x);

%f= @(x) sin(2*pi*x); +(((-1)^(j+1))*10^(-4));
pt=11
gr=10
%probamos con distintos valores ajuste (grado: (i))
for l=1:gr
  usopolyfit(-1,1,pt,l);
  pause(2)
end


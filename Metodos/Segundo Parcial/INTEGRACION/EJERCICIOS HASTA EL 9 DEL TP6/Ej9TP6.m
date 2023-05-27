%DATOS Ej9TP6
clear all
clc

f = @(x) (x.^2).*exp(-x);
ft = @(t) (1/2)*(t + 1);
a = 0; b = 1; L=1, n=2
Q=cuad_gauss_c(f,a,b,L,n)
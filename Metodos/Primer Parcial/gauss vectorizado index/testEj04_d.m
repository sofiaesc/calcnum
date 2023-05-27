% TestEj04_d.m
% prueba codigos sustitucion hacia atras Ej4 2020 punto d
% Sistema A x = b
 clear all
 clc

 A = [ 1 -1 2 -1; 0 2 -1 1; 0 0 -1 -1; 0 0 0 2]

 b = [-8 6 -4 4]'

[x,Indice] = elim_gaussIndice(A,b)






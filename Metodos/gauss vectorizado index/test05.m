% test03
clear all; clc
% generamos una matriz A

A = [1 2 -3 0; 3 -6 9 3; 2 1 4 1; 1 -2 2 -2]

% vector del lado derecho de Ax=b
b = [1 -1 2 -2]'

[x,Indice] = elim_gaussIndice(A,b)
% test04
% probamos los metodos
clear all; clc; clf
epsilon = 1e-16;
N=100;
A1=randi(10,N,N);
b1 = randi(10,N,1);
tic()
[x1,Indice] = elim_gaussIndice(A1,b1)
time = toc()

figure(1) % para ver la solucion
plot(x1)
grid on
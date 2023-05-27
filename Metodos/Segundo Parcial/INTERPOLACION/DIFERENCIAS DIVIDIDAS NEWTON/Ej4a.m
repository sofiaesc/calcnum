# Guia TP05 
# Ej4a
%Nueva guia Ej 3(Aula)
clear all;
clc; clf

x = [0 1 3/2 2]'

y = [3 3 13/4 5/3]'

[c, dv] = dif_div(x,y)

[a] = dd(x,y)
[b] = dd_01(x,y)
figure(1)
plot(x,y,'b*');
grid on, grid minor;

PN=@(x) c(1)+c(2).*(x)+c(3).*(x).*(x-1)+c(4).*(x).*(x-1).*(x-3/2);

xx=linspace(0,2,201);
PN=PN(xx);

hold on
plot(xx,PN,'r-');
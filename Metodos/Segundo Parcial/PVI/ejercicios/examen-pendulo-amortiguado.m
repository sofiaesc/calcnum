#EJERCICIO PENDULO CON AMORTIGUAMIENTO
clear all;
clc;
% problema
% theta'' + f(tetha)tetha' + sen(tetha) = 0
% f(tetha)= 0.8 si abs(tetha)<tetha_0
% o bien: abs(tetha) >= tetha_0
%tetha_0: angulo donde toca al fluido y se amortigua
% L*cos(tetha_0) = h donde: L=1; h=3/4; tetha(0) = pi/2 parte del reposo

#Defino el intervalo
a = 0;
b = 20;
h = 0.01
N = (b-a)/h;

#Datos
L = 1;
h = 3/4;
#Calculo el angulo donde comienza el amortiguamiento
tita_0 = acos(h/L);

#Defino el PVI
F = @(t, v) [v(2); (-0.8.*(abs(v(1))<tita_0).*v(2)-sin(v(1)))];
F0 = [pi/2; 0];

#Calculo PVI mediante RK4
[t,y] = rk4(F, a, b, F0, N);

plot(t, y(:,1));
grid on

disp('Solucion del punto "a" del Ejercicio, ')
disp('el angulo en ese momento es de:..')
y(end,1)
disp('En ese momento se esta moviendo de izquierda a derecha')

disp('solucion del punto "b" del ejercicio')
sol=[t , y(:,1)];
[a,b]=min(sol(:,2))
disp('maximo negativo:')
a
disp('Posicion de dicho valor:')
b
% cambia de orientacion el pendulo
disp('Momento en que cambia de direccion, tiempo:')
tiempo=sol(b)
#Resultados correctos
#a)
#-0.12461
#izquierda derecha

#b) 3.28

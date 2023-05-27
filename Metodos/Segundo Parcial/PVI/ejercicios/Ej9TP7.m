# Ej9TP7
clear all; clc; clf
%t = 0:0.25:15
a=0;
b=15; % estado final
inter =[a,b]; % Intervalo para la variable t
u0=[1; 0; -1]; % Valores iniciales
N=300; % para definir el paso de tiempo
% "u": solucion del problema
f = @(t,u) [u(2);u(3);-4*u(3)-5*u(2)-2*u(1)-4*sin(t)-2*cos(t)];

[t,u] = RungeKuttaMulti(f,a,b,u0,N); 
%[trk4,yrk4]=rk4(f, inter, u0, N);
format long g
y25 = u(1,end);
%yrk4=yrk4(1,51)
disp('El valor de la variable de estado y en t = 2.5, es:')
disp(y25)

figure(1)
plot(t,u(1,:),'r-o')
hold on
plot(t,u(2,:),'b-o')
plot(t,u(3,:),'g-o')
%linea del cero
plot([0,15],[0,0],'k-','linewidth',2)
%plot(t(11), y25, 'kd','MarkerSize',12)
plot(t(11), y25, 'kd','MarkerSize',15,'MarkerFaceColor','red','MarkerEdgeColor','green')
title('Ejercicio 9')
xlabel('Tiempo')
ylabel('Y')
legend('u1=y','u2=y´','u3=y"', 'diamond=y(2.5)')
grid on
grid minor
hold off


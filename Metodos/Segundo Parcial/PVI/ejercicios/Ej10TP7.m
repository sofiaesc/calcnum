# Ej10TP7
clear all; clc; clf
%t = 0:0.05:20;
t=linspace(0,20,400);
y=[];
y0=[3.5; 1]; % condicion inicial, segun los diferentes puntos del ejercicio
               % y0=[posicion; velocidad]     
L = 9.81; % longitud de la barra que sostiene la masa

# Planteo del modelo:
%f = @(t,y) [y(2,1);-(9.81/L)*sin(y(1,1))];
F = @(t,y) [y(2);-(9.81/L).*sin(y(1))];

# Lo calculo con un RK4

%[t,y] = RK4Sistemas(F,t,y0);
[t,y] = rk4Sistemas01(F,0,20,y0,400);
y=y';
t=t';
y10 = y(201,1);

disp('posicion al cabo de 10 seg:')
disp(y10)
%Graficamos el movimiento del pendulo
figure(1)
plot(t,y(:,1),'r-')
hold on
plot(t,y(:,2),'b-')
plot(t(201), y10, 'kd','MarkerSize',15,'MarkerFaceColor','red','MarkerEdgeColor','green')
legend('Posicion', 'Velocidad','posicion a los 10 seg')
grid on
grid minor



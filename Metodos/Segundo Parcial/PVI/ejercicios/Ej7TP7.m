% Ej7TP7.m
% Calculo de la trayectoria
clear all; clc; clf;

f = @(t,x) ([... 
            - t * x(2);... 
            t * x(1) - t*x(2)... 
            ]); 
 
t0 = 0; %Tiempo Inicial. 
tF = 20; %Tiempo Final. 
 
x0 = [1;-1]; % Punto de partida
 
h = 0.05; % paso de tiempo
N = (tF - t0)/h; % cantidad de pasos

% Calculamos por Euler
[t,x] = euler_adelante_multi(f,t0,tF,x0,N); 
 
figure(1); 
plot(x(1,:), x(2,:), "linewidth", 2); 
grid on; grid minor;
 
% Calculamos por RK4
[tRK, xRK] = rk4(f,[t0 tF],x0,N/2); 
 
for i = 1:length(tRK) 
  if (tRK(i) == 3) 
    posT3 = i; 
  endif 
endfor 
 
hold on; 
plot(x(1,posT3),x(2,posT3),"o"); #Posicion de la particula en 3 segundos. 
#Rapidez de la partícula en 3 segundos.  
rapidez = norm(f(tRK(posT3),[xRK(posT3,1) xRK(posT3,2)])); 

disp('La rapidez de la particula en el tiempo t=3 seg es:'),disp(rapidez)

% calculo de la trayectoria
compTray = sqrt ( (-tRK.*xRK(:,2)).^2 + (tRK.*xRK(:,1)-tRK.*xRK(:,2)).^2 ); 
Tray = SimpsonCompDatos(tRK(1:31),compTray(1:31)); %31 es el valor para elcual t=3 
 
 % calculo de la distancia cuando estamos a una distancia del origen de 0.01
d = norm(x,2,"cols"); 
[~,p] = min(abs(d - 0.01)); 

plot(x(1,p),x(2,p),"ro"); 
hold off
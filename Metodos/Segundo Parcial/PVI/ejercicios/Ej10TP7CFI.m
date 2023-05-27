# Ej10TP7CFI
clear all; clc; clf
# Resolvemos el problema del péndulo oscilante donde de su posicion inicial se va moviendo
# hasta que encuentra un liquido (cambia de ambiente) que lo amortigua. justo en un angulo
# tal que la posicion de la superficie libre de liquido se encuentra a una distancia "h"
# medida del punto de anclaje del pendulo, cuya longitud es L=1.
# PROBLEMA TOMADO EN CFI Y EL COLOQUIO 29-30-DE JULIO DE 2020.
# 
delta_t=0.01;
t = 0:delta_t:5;
h = 3/4;
L= 1;
theta0 = acos(h/L)

alfa=0; # COEFICIENTE DE AMORTIGUAMIENTO

# Aplicamos una operacion booleana para que pase o no en funcion de lo expresado
# en el enunciado del problema.

# Planteo del modelo:
f = @(t,y) [y(2);-(y(1)<theta0)*alfa*y(2)-sin(y(1))];
y0=[pi/2; 0];

# Lo calculo con un RK4
[t,y] = RK4Sistemas(f,t,y0);
t=t';
y=y';

#y1 = y(:,1);
#y2 = y(:,2);
sol = [t y];
#t = 5;
#N= 5/delta_t;
size(sol);

# Graficamos ambas: angulo y velocidad
figure(1)
plot(t,y)
hold on
#plot(t,y(2,:),'b-o')
xlabel('Tiempo')
ylabel('Angulo, Velocidad')
grid on;
grid minor


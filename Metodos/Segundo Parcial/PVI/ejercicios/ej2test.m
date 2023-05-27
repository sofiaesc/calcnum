clear all;
clc
#f = @(t,y) y-(t^2)+1;
f = @(t,y) -y + sin(t) + cos(t);
y0 = 0; % Condicion Inicial

# Calculamos la ODE; utilizando la función de Octave
[t,y] = ode45(f,[0,2],y0);
y
figure(1)
plot(t,y,'r-*')
grid on
grid minor
hold on

% determinamos los subintervalos de la variable t
r=2; j=[1:6];
c=10;
L=c.*r.^(j)'
h=1/L;
N=length(L)
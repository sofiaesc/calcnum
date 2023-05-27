% PREGUNTA 1 y 2:

% Se modela el sistema y'' = p(x)y' + q(x)y + r(x) para x en [0,1].
% Ver que el único término presente en el sistema dado es r(x), luego
% p(x) y q(x) se representan con 0*x.
f= @(x) [0*x 0*x -20*e.^(-10*(x-0.7).^2)];

% Intervalo [0,1]:
inter = [0 1];
% Condiciones de contorno:
yc = [5 6];

% 41 puntos => 40 pasos:
L = 40;

% Llamamos a la función de diferencias finitas directas.
[x,y]=dif_fin_dir(f,inter,yc,L);

figure(1)
plot(x,y,'r-')
grid on
grid minor

p = polyfit(x,y,2)
g= @(t) p(3) + p(2).*t + p(1).*t.^2;
g(0.5)
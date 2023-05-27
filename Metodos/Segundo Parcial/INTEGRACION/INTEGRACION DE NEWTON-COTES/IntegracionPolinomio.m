% Formula de Newton-Cotes simples
clear all; clc; clf;
% Funcion a integrar
%f = @(x) x.^3./(exp(x)-1);
% Extremos del Intervalo
%a=1; b= 10;

f = @(x) exp(-x.^2);
% Extremos del Intervalo
a=-5; b= 5;

% Cantidad de puntos a tomar
N=[2:12]';

% Creamos un vector para almacenar la integral del polinomio interpolante
% en 2, 3,4, ..... puntos
Integral_p = zeros(size(N));

% generamos un vector donde almacenamos las formulas simples de Newton-Cotes
% en 2, 3,4, ..... puntos
Q=zeros(size(N));

for i=1:numel(N)
  
% Calculamos la función, los puntos de interpolacion 
% y el polinomio interpolante
x = linspace(a,b,N(i));
coefp = polyfit(x,f(x),N(i)-1);
p = @(x) polyval(coefp,x);
 
% Graficamos la función, los puntos de interpolacion 
% y los polinomios interpolanttes
xx=linspace(a,b,301);
figure(1)
plot(x,f(x),'ro','MarkerSize',6,'MarkerFaceColor','r')
hold on
plot(xx,f(xx),'r-',xx,p(xx),'b-')
grid on; 
grid minor;
ejes=[a b -1 2];
axis(ejes)
hold off
%input('');
pause(1)

% Calculamos la integral de polinomio interpolante

coef_intp = polyint(coefp); % calcula la integral del polinomio
intp = @(x) polyval(coef_intp,x);
Integral_p(i) = intp(b)-intp(a);

% Ahora usamos la formula simple de Newton-Cotes
% Veremos que da lo mismo que el anterior.

Q(i)= integralNC(f,a,b,N(i));
end

format long
%format short g
[Integral_p Q]
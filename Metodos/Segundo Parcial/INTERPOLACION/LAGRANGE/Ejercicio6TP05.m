#Ejercicio6TP05.m
clear all; clc;clf

x=linspace(-1,1,21);

# valores de datos sin perturbar
y=sin(2*pi*x);

% Valores de datos perturbados

perturbacion = 1.e-04;
f=sin(2*pi*x)+(-1).^[1:21]*perturbacion; 

% SIN PERTURBAR
%f=sin(2*pi*x);

# Polinomio con valores Perturbados

gr=20; #grado del polinomio de lagrange
p=polyfit(x,f,gr);

% PLANTEAMOS MAS PUNTOS EN EL INTERVALO
xx=linspace(-1,1,201);
% USAMOS EL POLINOMIO CALCULADO
z=polyval(p,xx);

# Spline con valores perturbados
[a,b,c,d] = trazador_cubico_natural(x,f);
n = length(a);
xd = x;
M = [d c b a];
S = @(x) a(1)*(x == xd (1));
for i=1:n
 S = @(x) S(x) + ...
 polyval(M(i,:), (x - xd(i))).*(x>xd(i)).*(x<=xd(i+1));
end


% LO GRAFICAMOS
figure(1)
% GRAFICAMOS LOS PUNTOS DADOS.
plot(x,y,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
hold on % para graficar el Spline en la misma grafica.
 
% Graficamos el polinomio de Lagrange
plot(xx,z,'m-','linewidth',3)

% Grafica de la función Spline Cúbica Natural
plot(xx,S(xx),'k-','linewidth',3)

grid on
grid minor
xlabel('Datos X')
ylabel('Funcion (f(x))')
title('Analisis de la función con datos perturbados')

le1=sprintf('Valores dados a interpolar:');
le2=sprintf('Polinomio de Lagrange grado: ',gr);
le3=sprintf('Spline Cubica de los datos:');
legend(le1,le2,le3)
% linea del cero
plot([-1,1],[0,0],'k-')
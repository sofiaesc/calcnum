# testmatrix_CSN.m
clear all; clc; clf

x=linspace(-1,1,21)';
# valores de datos sin perturbar
n = length(x);
%y=sin(2*pi*x);

y = 1./(1+x.^2);
h =x(2:n)-x(1:n-1);

# Calculamos con el algoritmo de matrices Ax=b

[M,f] = matrix_CSN(x,y);

c = M\f;

c(1) = 0; # corresponde a la condicion de la frontera de x0 es decir la de la izquierda.
c(n) = 0;

# Calculamos los coeficientes d
  d = (c(2:n) - c(1:n-1))./(3 * h(1:n-1));
  # Calculamos los coeficientes b
  # (y(2:n) - y(1:n-1))'  (falto poner ')
  b = ((y(2:n) - y(1:n-1))./h(1:n-1)) - h(1:n-1).*(c(2:n) + 2*c(1:n-1))/3;
  # S(Xj) = f(Xj) = a(j)
  a = y(1:n-1);
  # Defino c
  c = c(1:n-1);
  
n = length(a);
xd = x;
M = [d c b a];
S = @(x) a(1)*(x == xd (1));
for i=1:n
 S = @(x) S(x) + ...
 polyval(M(i,:), (x - xd(i))).*(x>xd(i)).*(x<=xd(i+1));
end

xx=linspace(-1,1,201);
% LO GRAFICAMOS
figure(1)
% GRAFICAMOS LOS PUNTOS DADOS.
plot(x,y,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
hold on % para graficar el Spline en la misma grafica.
 
% Graficamos el polinomio de Lagrange
%plot(xx,z,'m-','linewidth',3)

% Grafica de la función Spline Cúbica Natural
plot(xx,S(xx),'k-','linewidth',3)

grid on
grid minor
xlabel('Datos X')
ylabel('Funcion (f(x))')
title('Analisis de la función con datos perturbados')

le1=sprintf('Valores dados a interpolar:');
%le2=sprintf('Polinomio de Lagrange grado: ',gr);
le2=sprintf('Spline Cubica de los datos:');
legend(le1,le2)
% linea del cero
plot([-1,1],[0,0],'k-')
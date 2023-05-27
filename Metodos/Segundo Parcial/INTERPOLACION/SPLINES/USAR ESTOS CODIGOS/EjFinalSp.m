%EjFinalSp
clear all; clc; clf
x= linspace(-5,6,9)
fx = @(x) log(x.^2+1) - exp(x./2).*cos(pi*x);
fx = fx(x);

df=@(x) ((2.*x)./(x.^2+1))+ pi*exp(x./2).*sin(pi.*x)-0.5*exp(x./2).*cos(pi.*x);

df0 = df(-5);
dfn = df(6);

[a, b, c, d] = Spline_Cubico_Sujeto(x, fx, df0, dfn);

# Visualizacion de las Splines por tramos
# Ejemplo Burden pag. 
xd = x;
n = length(a);
S=@(x) a(1)*(x==xd(1));
% segun Burden
for i=1:n
  S = @(x) S(x) +...
  (a(i) + b(i)*(x -xd(i)) + c(i)*(x -xd(i)).^2 + d(i)*(x - xd(i)).^3).*(x>xd(i)).*(x<=xd(i+1));
endfor


xx = linspace(xd(1), xd(end),201);
f = @(x) log(x.^2+1) - exp(x/2).*cos(pi*x);
% graficamos la función y la Spline junto a los puntos que usamos para calcularla
figure(1)
plot(xd,fx,'o',xx,S(xx),'g', xx, f(xx),'b')
grid on
grid minor

% Comparamos el valor de la función con la Spline en x=4.2
xx = 4.2;
% Error absoluto 
ErrorAbs = abs(f(xx)-S(xx))
ErrorCuad = norm(f(xx) - S(xx))
ErrorRelat = abs(f(xx)-S(xx))/abs(f(xx))


% miramos la grafica y vemos donde esta el error maximo
S
a1=3.5;
b1=5.5;
maxit = 1000;
tol=1e-9;
% calculo con biseccion el valor maximo p
[p] = biseccion(S, a1, b1, maxit, tol)


# EjemlploSpline
# armado de una spline cubica (trazador cubico)
# primero debemos generar la Spline en funcion del problema
# lo probe con el ejemplo del libro Burden
# la función a aproximar es f(x) = e^x
# x=[0 1 2 3]  con la función  f(x): y = [ 1 exp(1) exp(2) exp(3)]

x=[0 1 2 3];
y = [ 1 exp(1) exp(2) exp(3)];

[a, b, c, d] = Spline_Cubico_Natural(x, y)

# Visualizacion de las Splines por tramos
# Ejemplo Burden pag. 
xd = x;
n = length(a);
S=@(x) a(1)*(x==xd(1));
# forma 1:
for i=1:n
  S = @(x) S(x) +...
  (a(i) + b(i)*(x -xd(i)) + c(i)*(x -xd(i)).^2 + d(i)*(x - xd(i)).^3).*(x>xd(i)).*(x<=xd(i+1));
endfor

xx = linspace(xd(1), xd(end),201);
f = @(x) e.^x;
figure(1)
plot(xd,y,'o',xx,S(xx), xx, f(xx),'b')
grid on
grid minor

# forma 2
# Otra manera de hacerlo, generando una matriz con los coeficientes
M = [d' c' b' a']
S = @(x) a(1)*(x == xd (1));
for i=1:n
  S = @(x) S(x) + ...
  polyval(M(i,:), (x - xd(i))).*(x>xd(i)).*(x<=xd(i+1));
endfor

xx = linspace(xd(1), xd(end),201);
f = @(x) e.^x;

figure(2)
plot(xd,y,'o',xx, S(xx),xx, f(xx),'b')
grid on
grid minor
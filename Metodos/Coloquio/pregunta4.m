clear; clc;

f  = @(x) log(x.^2 + 1) - e.^(x./2).*cos(pi.*x);
df = @(x) pi*e.^(x./2)*sin(pi.*x) - (1/2)*e.^(x./2)*cos(pi.*x) + (2.*x)/(x.^2+1);

x = linspace(-5,6,9);

a = -5;
b = 6;

# Calculando el valor de la derivada en cada extremo se tiene 
fp0 = df(a);
fpn = df(b);

#Creando spline
[c1 c2 c3 c4] = cubic_spline_clamped(x,f(x),fp0,fpn);
%[c1 c2 c3 c4] = cubic_spline_natural(x,f(x));
M = [c4' c3' c2' c1'];
S = crear_spline(M,x);

#Buscando error en x = 4.2
x_42 = 4.2;
err_42 = abs(f(x_42)-S(x_42));

#Buscando valor maximo (inspeccionando la grafica se observa que se encuentra
#entre x = 4 y x = 4.2)

x_aux = linspace(4,4.2,401);
[ymax imax] = max(S(x_aux));
xmax = x_aux(imax);
%9.808541677489536 -> 101
%9.808549156263277 -> 201
%9.808549156263277 -> 401
S(xmax)

figure(1)
xx = linspace(-5,6,201);
hold on;
grid on;
plot(x,S(x),'g*')
plot(xx,f(xx));
plot(xx,S(xx));
leyendas = ['Puntos utilizados';'Funcion' ; 'Spline'];
legend(leyendas);
hold off;

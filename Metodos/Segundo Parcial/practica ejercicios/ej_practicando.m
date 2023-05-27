clear all;
clc;
format long g
clf;

display("\n---------------PREGUNTA 3-----------------") %BIEN
% Segunda ley de Newton con F = mg - cv. Distancia y tiempo al tocar el piso.
g = 9.81;
m = 10;
c = 0.2;
inter = [0:0.001: 3];

%x1(0) = 0, x2(0) = 30, x1'(0) = 40, x2'(0) = 0.
z0=[0, 30, 40, 0]; 


f = @(t,z) [z(3); z(4);-(0.2/10).*z(3); -(9.81)-(0.2/10).*z(4)];
[t,z] = RK4Sistemas(f,inter,z0);

posx = z(1,:)';
posy = z(2,:)';

y = posy;
py = polyfit(t',y,2);

gy =@(t) py(3)+py(2).*t +py(1).*t.^2;
[p_t, rh, it, t1] = biseccion(gy, 2.4, 2.6, 100, 0.00000001);
p_t

x = posx;
px = polyfit(t',x,2);
gx =@(t) px(3)+px(2).*t +px(1).*t.^2;
dx = gx(p_t)

%---------- inciso b: Longitud de la trayectoria de la partícula durante
% los primeros T segundos. Integral de [0,T] de sqrt(x'1(t)^2 + x'2(t)^2) dt.

g = 9.81;
m = 10;
c = 0.2;
inter = [0:0.01: 2];
z0=[0, 30, 40, 0]; 
f = @(t,z) [z(3); z(4);-(0.2/10).*z(3); -(9.81)-(0.2/10).*z(4)];
[t,z] = RK4Sistemas(f,inter,z0);

posx = z(1,:)';
posy = z(2,:)';
posx0 = z(1,1);
posy0 = z(2,1);
rapx0 = z(3,1);
rapy0 = z(4,1);

[Sx,dSx] = funcion_spline(t,posx,posx0,rapx0);
[Sy,dSy] = funcion_spline(t,posy,posy0,rapy0);

g = @(x) sqrt(dSx(x).^2 + dSy(x).^2);
%Q=quad(g,0,2,10^-6)

display("\n---------------PREGUNTA 4-----------------") %BIEN
% Error cometido por un spline cúbico sujeto dada una función.
f= @(x) log(x.^2+1)-(e.^(0.5*x)).*cos(pi.*x);
df = @(x) 2*x./(x.^2+1) - 0.5*e.^(0.5*x).*cos(pi.*x)+pi.*e.^(x/2).*sin(pi.*x);
dy0=df(-5);
dyn=df(6);

x=linspace(-5,6,9);
y=f(x);
x=x';
y=y';
[Sx,dSx]=funcion_spline(x,y,dy0,dyn);
err=abs(Sx(4.2)-f(4.2))

% Como dice error absoluto menor a 10^-9, la respuesta es 4.088961382
[p, rh, it, t] = biseccion(dSx, 3, 5, 200, 10^-9);
p
Sx(p)

display("\n---------------PREGUNTA 6-----------------") % BIEN
% Segunda ley de Newton con ft = -cv - kx (resorte sin fuerza externa).
m = 20;
k = 20;
c = 10;
inter = linspace(0,10,1000); %muchos puntos para ver bien la gráfica.
z0 = [1 0];

f = @(t,z) [z(2);-0.5*z(2)-z(1)];
[t,z] = RK4Sistemas(f,inter,z0);
z(1,end) % 5 cifras decimales exactas: -0,084776.

figure(1)
plot(t,z(1,:),'r-') % -0.71
hold on
plot(t,z(2,:),'m-') % 1.36

display("\n---------------PREGUNTA 7-----------------") % BIEN
% Mínimos cuadrados para una tabla de valores. Buscar el ajuste a*e^(bx).

x=[1 1.2 1.4 1.6 1.8 2.0 2.2 2.4];
y=[0.678 0.512 0.387 0.293 0.221 0.167 0.126 0.096];
% como necesito e^(bx+a), transformo la tabla de datos con ln(y) 
y=log(y);

p= polyfit(x,y,1);
a =e^(p(2));
b=p(1);
f=@(x) a*e^(b*x);
f(1.9) % 5 dígitos decimales correctos: 0,19236

df=@(x) a*b*e^(b*x);

% Area de la superficie de revolucion al girar el gráfico alrededor del eje x:
inter=[1, 2.4];
fi=@(x) 2*pi.*f(x).*sqrt(1+df(x).^2);
Qr=quad(fi,1,2.4)


display("\n---------------PREGUNTA 8-----------------") % BIEN
% Obtener área de superficie de revolución con cuadratura de Gauss n = 3, L = 10.

f=@(x) 1+x+cos(x);
df=@(x) 1-sin(x);
fi=@(x) 2*pi.*f(x).*sqrt(1+df(x).^2);
a = 0;
b = 4;
L=10;
n=3;
Q=cuad_gauss_c(fi,a,b,L,n)
Q_Ex=quad(fi,a,b)
abs(Q-Q_Ex) %como dice ^-7, son 6. comparando tambien se ve que son 6.


display("\n---------------PREGUNTA 9-----------------") % BIEN.
% Péndulo amortiguado (toca el agua en cierto ángulo).

L = 1;
h = 3/4;
delta_t = 0.01;
t = [0:delta_t:5];
alfa = 0.8;
theta0 = acos(h/L);

f = @(t,y) [y(2);-(abs(y(1))<theta0)*alfa*y(2)-sin(y(1))];
y0 = [pi/2; 0];

[t,y] = RK4Sistemas(f,t,y0);
t=t';
y=y';
sol = [t y] %-0,12461 da medio distinto

%para b) puedo ver la tabla, con gráfico o con biseccion.

# Graficamos ambas: angulo y velocidad
figure(2)
plot(t,y)
hold on
xlabel('Tiempo')
ylabel('Angulo, Velocidad')
grid on;
grid minor

display("\n---------------PREGUNTA 10-----------------") % BIEN
% Dada una f en [1 2 3], elegir la S0(x) y S1(x) correcta con trazador cubico natural.

f=@(x) 5./x;
x=linspace(1,3,3);
y=f(x);
[a,b,c,d] = trazador_cubico_natural(x,y)
% los spline para 1<x<2 y 2<x<3 tienen los coeficientes de abcd respectivamente.


display("\n---------------PREGUNTA 11-----------------") % BIEN
% PVI de orden 3 pasar a orden 1 y obtener puntos de inflexion (ceros de la 3ra deriv).

f=@(t,w) [w(2); w(3); -4*sin(t)-2*cos(t)-2*w(1)-5*w(2)-4*w(3)];
inter = [0:0.1:5];
u0=[1 0 -1];
[t,u] = RK4Sistemas(f,inter,u0);
x3 = u(3,:)';

figure(3)
plot(t,x3,'m-')%grafico la tercera derivada y busco los puntos criticos a ojo.
hold on
plot(t,0*t,'k-') 
% puedo seguir esto con biseccion para aproximar mejor si no es multiple choice.


display("\n---------------PREGUNTA 13-----------------") % BIEN
% Área de superficie de revolución con cuadratura de gauss n=3 y L=30.

f=@(x) 2+cos(x)-sin(3*x);
df=@(x) -sin(x)-3*cos(3*x);
fi=@(x) 2*pi.*f(x).*sqrt(1+df(x).^2); 
a=0;
b=3;
L=30;
n=3;
Q=cuad_gauss_c(fi,a,b,L,n)
Q_Ex=quad(fi,a,b)
abs(Q-Q_Ex)


display("\n---------------PREGUNTA 14-----------------") % BIEN
% Brazo mecánico con dos etapas. Obtener velocidad en X y en Y con dSx, dSy.
x1 = [0,2,6]; % primera etapa.
y1 = [0,4,6];
t1 = [0,1,2]; 
x2 = [6,3,0]; % segunda etapa.
y2 = [6,2,0];
t2 = [2,3,4];

%como sigue repitiendo la etapa 1 después de la 2,
%el segundo 5.5 es el 1.5 de la etapa 1. luego:

[S,dS] = funcion_spline(t1',x1',0,0);
dS(1.5)
[S,dS] = funcion_spline(t1',y1',0,0);
dS(1.5)

display("\n---------------PREGUNTA 15-----------------") % BIEN
% Dada una función en [1 2 3] hacer interpolacion polinomica y 
% determinar el error máximo teórico y el error real.
f=@(x) 1./(4*x);
a=1;
b=3;
n=3;
xx=linspace(1,3,3);
y=f(xx);

P=polyfit(xx,y,2);
%[P, c, N] = PolIntNewton(x, y);
g=@(x) P(1)*x.^2+P(2)*x+P(3);

% COTA DE ERROR:
% Como tengo 3 puntos, [1 2 3], saco la derivada tercera.
df1=@(x) -0.25*x.^-2;
df2=@(x) 0.5*x.^-3;
df3=@(x) -1.5*x.^-4;

% Busco el máximo del valor absoluto de la derivada tercera.
plot(xx,abs(df3(xx)),'r-')
% Está en 3/2, luego sigue:

% ERROR TEÓRICO:
e_t=abs(((3/2)/factorial(3))*(1.7-1)*(1.7-2)*(1.7-3))

% ERROR REAL:
e_r = abs(f(1.7) - g(1.7))


display("\n---------------PREGUNTA 16-----------------") % BIEN 
% Péndulo simple, indicar posicion a los 10 segundos.

% ir cambiando este 800 y el del rk4 para ver los digitos decimales correctos bien.
t=linspace(0,20,800); 
L=2;
y0=[0; 1];
F = @(t,y) [y(2);-(9.81/L).*sin(y(1))];
[t,y] = rk4Sistemas01(F,0,20,y0,800); % cambiar el 800 p/ ver precision
y=y';
t=t';
t(401) %verifico que este valor sea 10.
y10 = y(401,1)

display("\n---------------PREGUNTA 17-----------------")
% Péndulo doble, unidos por un resorte.
g = 9.81;
m1 = 1;
m2 = 3;
k = 3;
c = 0.2;
L = 15;
inter = [0:0.1:10];
z0=[0, 0, -1, 1]; 
f = @(t,z) [z(3); z(4);(-g)/L - (3/m1)*(z(1)-z(2)); (-g)/L + (3/m2)*(z(1)-z(2))];
[t,z] = RK4Sistemas(f,inter,z0);

posx1 = z(1,end) % posicion del primero en t = 10
posx2 = z(2,end) % posicion del primero en t = 10
rapx1 = z(3,end) % como la velocidad es negativa, va de izq. a der.
rapx2 = z(4,end)% como la velocidad es negativa, va de izq. a der.
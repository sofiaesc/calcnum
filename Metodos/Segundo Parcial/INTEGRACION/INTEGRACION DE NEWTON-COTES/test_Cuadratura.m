% prueba metodo cuadratura del trapecio
%test_Cuadratura.m
clear all; clc; clf;
% funciones a utilizar

%f=@(x) x.^3./(exp(x)-1);

f= @(x) exp(-x.^2);
a=-5;
b=5;
xx = linspace(a,b,201);

ff = f(xx);

f0=f(a);
fn=f(b);

% funcion lineal para probar el trapecio.
A=[1 1; 1 10];
ld=[f0;fn];
 
s=A\ld;
 
g=@(x) s(1) + s(2).*x;
gg=g(xx);

[Q2] = trapezoidal(f,a,b)

figure(1)
plot(xx,ff,'r-',xx,gg,'b-');
grid on 
grid minor
xlabel('X')
ylabel('función f(x), g(x)')
hold on

ptos = 3;
xd = linspace(a,b,ptos);
yd = f(xd);
[Q3] = Simpson13(f,a,b)
cp3 = polyfit(xd,yd,ptos-1);
p3 = polyval(cp3,xx);
plot(xx,p3,'k-')

nptos = 4;
xp = linspace(a,b,nptos);
yp = f(xp);
[Q4] = Simpson38(f,a,b)
cp4 = polyfit(xp,yp,nptos-1);
p4 = polyval(cp4,xx);
plot(xx,p4,'m-')

zptos = 5;
xz = linspace(a,b,zptos);
yz = f(xz);
[Q5] = Simpson5(f,a,b)
cp5 = polyfit(xz,yz,zptos-1);
p5 = polyval(cp5,xx);
plot(xx,p5,'g-')

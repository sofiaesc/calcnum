# ejercicio 9 otra manera
#Ej9TP05New

clear all
clc
clf
# datos
x = [0 1 2 3 4 5 6]'
y = [432 599 1012 1909 2977 4190 5961]'
y10 = 14900;
n = length(x);
x10 = 10;

xx=linspace(-1,10.5,201);

p6 = polyfit(x, y,6);
p1 = polyfit(x, y,1);
p2 = polyfit(x, y,2);

figure(1)
hold on
plot(xx, polyval(p6,xx),'k',"linewidth",2);
plot(xx, polyval(p1,xx),'b',"linewidth",2);
plot(xx, polyval(p2,xx),'g',"linewidth",2);
plot(x, y,'ro',"linewidth",2);
plot(x10,y10,'*k',"linewidth",2);
grid on;
xlabel ('Mediciones')
ylabel('Cantidad')
legend('p6-grado6', 'p1-Lineal', 'p2-Cuadratico', 'datos')
# Calculo del error cuadratico medio

ecm1 = sum((y - polyval(p1,x)).^2)/n;
ecm2 = sum((y - polyval(p2,x)).^2)/n;
ecm6 = sum((y - polyval(p6,x)).^2)/n;



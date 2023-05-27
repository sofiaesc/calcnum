# pred_presa.m
clear all; clc; clf
# x: predadores y presas
t = [0:1:20]; # variable dependiente
x0=[1600; 800]; # condicion inicial

f = @(t,x) [x(1)*(3-0.002*x(2)); -x(2)*(0.5-0.0006*x(1))];
%u = RK4Sistemas(f,t,u0);

[t, x] = pvi_rk4(f, [0,20], x0, 1000);

[te,xe] = euler(f,[0,20], x0,1000);


x1=x(:,1);
x2=x(:,2);

xe1=xe(:,1);
xe2=xe(:,2);

figure(1)
plot(t,x(:,1),'r-o')
hold on
plot(t,x(:,2),'b-o')
grid on
grid minor
title('Evolución de las especies')
xlabel('Tiempo (Meses desde el momento inicial)')
ylabel('Cantidad de individuos')
legend('Presa=x1', 'Predador=x2')
hold off

figure(2)
plot(x1,x2,'k-o')
grid on
grid minor;
title('Orbita de la solución del sistema predador-presa')
xlabel('Presas (en miles)')
ylabel('Predadores (en miles)')
legend('Eje X: Presas; Eje Y:Predadores')

figure(3)
plot(te,xe(:,1),'r-o')
hold on
plot(te,xe(:,2),'b-o')
grid on
grid minor
title('Evolución de las especies')
xlabel('Tiempo (Meses desde el momento inicial)')
ylabel('Cantidad de individuos')
legend('Presa=xe1', 'Predador=xe2')
hold off

figure(4)
plot(xe1,xe2,'k-o')
grid on
grid minor;
title('Orbita de la solución del sistema predador-presa')
xlabel('Presas (en miles)')
ylabel('Predadores (en miles)')
legend('Eje X: Presas; Eje Y:Predadores')

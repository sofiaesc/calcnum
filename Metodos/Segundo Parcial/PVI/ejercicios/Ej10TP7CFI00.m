# Ej10TP7CFI00

clear all; clc; clf
t = 0:0.05:20;
%y0=[pi/2; 0];
y0=[0; 2.01];
# Planteo del modelo:
f = @(t,y) [y(2,1);-sin(y(1,1))];

# Lo calculo con un RK4
[t,y] = RK4Sistemas(f,t,y0);

chvelo = min(y(2));
ym=y(1,201)


figure(1)

plot(t,y)
hold on
#plot(t,y(2,:),'b-o')
grid on
grid minor
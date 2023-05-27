# EjerExamen270820.m
clear all; %clc; clf
t = [0:0.001: 2.4942];
t = [0:0.001: 2]; % distancia primeros dos segundos
z0=[0, 30, 40, 0];
c = 0.2;
m = 10;
%L = 160;
# Planteo del modelo:
f = @(t,z) [z(3); z(4);-(0.2/10).*z(3); -(9.81)-(0.2/10).*z(4)];

# Lo calculo con un RK4
[t,z] = RK4Sistemas(f,t,z0);

posx = z(1,:)';
posy = z(2,:)';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculo del tiempo donde toca el piso
y = posy;
p = polyfit(t',y,2);

g =@(t) p(3)+p(2).*t +p(1).*t.^2;
[p, rh, it, t1] = biseccion(g, 2.4, 2.6, 100, 0.00000001);
p
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
%hold on
plot(posx,posy,'r-')
title('Ejercicio Examen 27-08-20')
xlabel('coord x')
ylabel('coord y')
%legend('x1=','y2=y´', 'diamond=y(10)' )
grid on
grid minor
figure(2)
plot(t, posy,'b-')
title('Ejercicio Examen 27-08-20')
xlabel('tiempo')
ylabel('coordenada y')
grid on
grid minor
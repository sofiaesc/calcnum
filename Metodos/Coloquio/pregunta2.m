clear; clc;
format long;

#Sistema de ecuaciones diferenciales
# m1*x1'' = -(m1*g/L)*x1 - k*(x1 - x2)
# m2*x2'' = -(m2*g/L)*x2 + k*(x1 - x2)

#Reacomodando el sistema
# x1'' = -(g/L)*x1 - (k/m1)*(x1 - x2)
# x2'' = -(g/L)*x2 + (k/m2)*(x1 - x2)

#Sustituciones
# y1 = x1
# y2 = x2
# y3 = x1'
# y4 = x2'


#Nuevo sistema de ecuaciones
# y1' = y3
# y2' = y4
# y3' = -(g/L)*y1 - (k/m1)*(y1 - y2) 
# y4' = -(g/L)*y2 + (k/m2)*(y1 - y2) 

L = 15;
m1 = 1;
m2 = 3;
k = 3;
g = 9.81;

F = @(t,Y) [
            Y(3);
            Y(4);
        ( -(g/L)*Y(1) - (k/m1)*(Y(1)-Y(2)) );
        ( -(g/L)*Y(2) + (k/m2)*(Y(1)-Y(2)) )
            ];

            
y0 = [0 0 -1 1]';

a = 0;
b = 10;

h = 0.5;     %0.2912135532690567 y 0.7048549204987615
h = h/2;     %0.3125606488367024 y 0.6979002004543615
h = h/2;     %0.318772768385968  y 0.695824373009049
h = h/2;     %0.3192650275672843 y 0.695659495453206
h = h/2;     %0.319298312273668  y 0.695648336515148
h = h/2;     %0.319300460379707  y 0.695647616024455   -> 6 decimales exactos
%h = h/2;     %0.319300596583449  y 0.695647570330635    

N = (b-a)/h;

[t W] = RK4(F,a,b,N,y0);


# Posicion y velocidad de cada objeto a los 10 segundos
y1_10 = W(1,end);    
y2_10 = W(2,end);    
dy1_10 = W(3,end);
dy2_10 = W(4,end);

xx = linspace(0,10,2048);
p = polyfit(t,W(4,:),639);
P = polyval(p,xx);
figure(1)
plot(xx,P)

# Si el segundo objeto cambia de direccion entonces su derivada en ese momento 
# vale cero. Esto, observando su grafica, ocurre por primera vez entre t = 1 y 
# t = 1.2

[a b c d] = cubic_spline_natural(t,W(4,:));
M = [d' c' b' a'];
#S = crear_spline(M,t);


#[dy_0 r_h] = secante(S,1,1.2,100,10^-8);
%10^-3 -> 1.0592004174564
%10^-4 -> 1.059198528891015


tt = linspace(0,10,201);
figure(2) 
hold on;
grid on;
plot(t,W(4,:));
#plot(tt,S(tt));
hold off;




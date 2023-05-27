clc
clear all
close all

disp('*************************************************');
disp('**** Este programa simula un tiro parabolico ****');
disp('*************************************************');


%Variables a utilizar 
g = 9.81;
Vo = input('Ingrese la velocidad inicial: ');
teta = input('Ingrese el angulo que forma con la horizontal: ');
H = input('Ingrese la altura inicial: ');
teta = teta*(pi/180);
%t = 2*Vo*sin(teta)/g;
%Xmax = Vo*cos(teta)*t;
t = ( (Vo*sin(teta))+((Vo*sin(teta))^2+2*H*g)^0.5)/g;
t1 = [0:0.02:t];
Xmax = Vo*cos(teta).*t1;
xmax = Vo*cos(teta)*t;
ymax = H + ((Vo*sin(teta))^2)/(2*g);
y = H + (Vo*sin(teta)).*t1-(0.5*g).*(t1.^2);
figure(1),plot(t1,y,'*'), title('Grafica Y vs t'),xlabel('t[segundos]'),ylabel('X[metros]');
grid on; grid minor
y2 = H + (tan(teta).*Xmax)-(0.5*g/(Vo*cos(teta))^2).*(Xmax.^2);
figure(2),plot(Xmax,y2,'r*'), title('Grafica Y vs X'),xlabel('X[metros]'),ylabel('Y[metros]');
grid on; grid minor
hold on;

for i=1:0.5:xmax
    
    y3 = H + (tan(teta)*i)-(0.5*g/(Vo*cos(teta))^2)*(i^2);
    hold on ;
    pause(0.01);
    figure(3),plot(i,y3,'*'),axis([0 xmax 0 ymax+H]);
    grid on; grid minor
end

disp('Altura Maxima: ')
ymax
disp('Distancia Maxima: ')
xmax
disp('Tiempo total: ')
t
#Ej8_TP05.m
clear all, clc; clf;
%DATOS:
x1 = [0,2,6];
y1 = [0,4,6];
t1 = [0,1,2];
x2 = [6,3,0];
y2 = [6,2,0];
t2 = [2,3,4];
% GRAFICA Tiempo vs X
figure (1) 
plot(t1,x1,'bo','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10,...
t2,x2,'bo','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10); 
grid on
grid minor
xlabel("Tiempo"); 
ylabel("Posicion en X"); 
title('Grafica Tiempo vs X');
hold on;

% GRAFICA T vs Y
figure (2); 
plot(t1,y1,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10,...
t2,y2,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10); 
grid on
grid minor
xlabel("Tiempo"); 
ylabel("Posicion en Y"); 
title('Grafica Tiempo vs Y');
hold on;

% GRAFICA X vs Y
figure (3); 
plot(x1,y1,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10,...
x2,y2,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10); 
grid on
grid minor
xlabel("X"); 
ylabel("Y"); 
title('Grafica X vs Y');
hold on;

% GRAFICA LAS SPLINES DE LA PRIMERA ETAPA trayectorias azules
[ax,bx,cx,dx] = trazador_cubico_sujeto(t1,x1,0,0)
%[ax, bx, cx, dx] = Spline_Cubico_Sujeto(t1, x1, 0, 0);
Mx = [ax,bx,cx,dx]; % Matriz con coeficientes de cada trayectoria
[ay,by,cy,dy] = trazador_cubico_sujeto(t1,y1,0,0)
%[ay, by, cy, dy] = Spline_Cubico_Sujeto(t1, y1, 0, 0)
My = [ay,by,cy,dy]; % Matriz con coeficientes de cada trayectoria
n = size(Mx,1);
# Armamos las splines para las dos trayectorias en cada etapa
for i = 1:n
tt = linspace(t1(i),t1(i+1));
xx = Mx(i,1)+Mx(i,2)*(tt-t1(i))+Mx(i,3)*((tt-t1(i)).^2)+Mx(i,4)*((tt-t1(i)).^3);
yy = My(i,1)+My(i,2)*(tt-t1(i))+My(i,3)*((tt-t1(i)).^2)+My(i,4)*((tt-t1(i)).^3);

figure (1); 
plot(tt,xx,'b-',"linewidth",3);
figure (2); 
plot(tt,yy,'b-',"linewidth",3);
figure (3); 
plot(xx,yy,'b-',"linewidth",3);
endfor

% GRAFICAS LOS SPLINES DE LA SEGUNDA ETAPA trayectorias rojas
[ax,bx,cx,dx] = Spline_Cubico_Sujeto(t2,x2,0,0); # programnado segun el Burden
Mx = [ax',bx',cx',dx']; % Matriz con coeficientes de cada trayectoria
[ay,by,cy,dy] = Spline_Cubico_Sujeto(t2,y2,0,0); # programnado segun el Burden
My = [ay',by',cy',dy']; % Matriz con coeficientes de cada trayectoria
n = size(Mx,1);
# Armamos las splines para las dos trayectorias en cada etapa
for i = 1:n
tt = linspace(t2(i),t2(i+1));
xx = Mx(i,1)+Mx(i,2)*(tt-t2(i))+Mx(i,3)*((tt-t2(i)).^2)+Mx(i,4)*((tt-t2(i)).^3);
yy = My(i,1)+My(i,2)*(tt-t2(i))+My(i,3)*((tt-t2(i)).^2)+My(i,4)*((tt-t2(i)).^3);
figure (1); 
plot(tt,xx,'r-',"linewidth",2);
figure (2); 
plot(tt,yy,'r-',"linewidth",2);
figure (3); 
plot(xx,yy,'r-',"linewidth",2);
endfor
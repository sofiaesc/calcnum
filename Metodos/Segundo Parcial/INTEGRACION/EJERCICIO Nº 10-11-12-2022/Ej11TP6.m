%Ej11TP6.m
clear all; clc; 
 f=@(u,v) (pi/2)*(10*(0.5*(u+1))+((0.5*(u+1)).^4).*cos(3*pi*v) + 2*((0.5*(u+1)).^3).*sin(2*pi*v));
 %f=@(u,v) (pi/2)*((0.5*(u+1)).^2).*((pi*v).^2)
 a=-pi;b=pi;c=0;d=1;
 n=2;m=2;
 
 % calculo de la Energia Total sobre la placa, consideramos rho*c=1
 J=cuad_gauss_doble(f,a,b,c,d,m,n)
 Q=quad2d(f,a,b,c,d)
 Q1=dblquad(f,a,b,c,d)
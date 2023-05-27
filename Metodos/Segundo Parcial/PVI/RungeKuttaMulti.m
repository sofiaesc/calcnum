# Metodo de Runge-Kutta de orden 4 - pvi_rk4.m
% para resolver
% y' = f(t,y) en [t0,TF]
% y(t0) = y0
% Usando L pasos
% y0 puede ser vectorial o escalar
 function [x, w] = RungeKuttaMulti(f,a,b,y0,N) 
 h = (b-a)/N;
 x=[a:h:b];
 % reservamos lugar en memoria para w
 w = zeros(length(y0),N+1);
 w(:,1) = y0;

 for n=1:N
 k1 = h * f(x(n), w(:,n));
 k2 = h * f(x(n)+h/2, w(:,n)+k1/2);
 k3 = h * f(x(n)+h/2, w(:,n)+k2/2);
 k4 = h * f(x(n)+h, w(:,n)+k3);

 w(:,n+1) = w(:,n) + (k1+2*k2+2*k3+k4)/6;
 endfor
 endfunction
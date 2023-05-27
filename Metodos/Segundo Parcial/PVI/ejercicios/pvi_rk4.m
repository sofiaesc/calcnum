# Metodo de Runge-Kutta de orden 4 - pvi_rk4.m
% para resolver
% y' = f(t,y) en [t0,TF]
% y(t0) = y0
% Usando L pasos
% y0 puede ser vectorial o escalar
 function [t, y] = pvi_rk4 (f, inter, y0, L)
 t = linspace(inter(1),inter(end),L+1)';
 h = (inter(end)-inter(1))/L;

 % reservamos lugar en memoria para y
 y = zeros( length(y0), L+1 );

 y(:,1) = y0;

 for n=1:L
 k1 = h * f(t(n), y(:,n));
 k2 = h * f(t(n)+h/2, y(:,n)+k1/2);
 k3 = h * f(t(n)+h/2, y(:,n)+k2/2);
 k4 = h * f(t(n)+h, y(:,n)+k3);

 y(:,n+1) = y(:,n) + (k1+2*k2+2*k3+k4)/6;
 end
 y=y';
 endfunction
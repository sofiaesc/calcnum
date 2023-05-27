function Q = integralNC(f,a,b,n)
% function Q = integralNC(f,a,b,n)
% se calcula la integral de f sobre [a,b]
% aproximadamente, usando la formula
% de Newton-Cotes de n puntos
w = pesosNC(n);
x = linspace(a,b,n);
fx = f(x);
Q = (b-a)*(fx*w);
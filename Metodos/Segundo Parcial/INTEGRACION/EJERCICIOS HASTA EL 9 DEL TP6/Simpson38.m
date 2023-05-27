function [Q4] = Simpson38(f,a,b)
n=4;
xp=linspace(a,b,n);
h=(b-a)/4;
Q4 = (3*h/8) .* (f(a)+3*f(xp(2))+3*f(xp(3))+f(b));
endfunction
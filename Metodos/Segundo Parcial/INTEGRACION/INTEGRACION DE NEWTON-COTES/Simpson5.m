function [Q5] = Simpson5(f,a,b)
n=5;
xz=linspace(a,b,n);
h=(b-a)/5;
Q5 = (2*h/45) .* (7*f(a)+32*f(xz(2))+12*f(xz(3))+ 32*f(xz(4))+7*f(b));
endfunction
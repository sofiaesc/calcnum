function [Q3] = Simpson13(f,a,b)
h = (b-a)/2;
Q3 = h/3 .* (f(a)+f(b)+4*f((a+b)/2));
endfunction

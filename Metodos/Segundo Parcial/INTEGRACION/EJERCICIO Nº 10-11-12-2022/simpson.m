function s = simpson(f,a,b)
h = (b-a)/2;
s = h/3 * (f(a)+f(b)+4*f((a+b)/2));
endfunction
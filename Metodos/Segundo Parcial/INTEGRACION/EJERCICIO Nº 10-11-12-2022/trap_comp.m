function s = trap_comp(f,a,b,m)
x = linspace(a,b,m+1);
s = (f(a)+f(b))/2;
s = s + sum(f(x(2:1:m)));
s = s*(b-a)/m;
end
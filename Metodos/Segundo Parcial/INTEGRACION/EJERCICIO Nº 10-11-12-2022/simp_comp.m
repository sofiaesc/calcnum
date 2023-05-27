function s = simp_comp(f,a,b,m)
h = (b-a)/(2*m);
#x = linspace(a,b,m+1);
x =[a:h:b];
s = (f(a)+f(b));
s = s + 2*(sum(f(x(3:2:2*m-1))))+ 4*(sum(f(x(2:2:2*m))));
s = (h/3)*s;
end
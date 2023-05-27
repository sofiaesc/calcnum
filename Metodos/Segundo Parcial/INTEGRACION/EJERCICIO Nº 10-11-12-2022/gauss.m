function s = gauss(F,ft,a,b)
x0 = 0;
x1 = sqrt(3/5);
x2 = -x1;
w0 = 8/9;
w1 = w2 = 5/9;
s = F(ft(x0))*w0 + F(ft(x1))*w1+F(ft(x2))*w2;
s = (b-a)/2 * s;
endfunction
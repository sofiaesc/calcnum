function Q = intNCcompuesta(f,a,b,L,n)
  # n puntos
  # L subintervalos
  
  y = linspace(a,b,L+1);
  h = (b-a)/L;
  w = pesosNC(n);
  Q = 0;
  for i = 1:L
    x = linspace(y(i),y(i+1),n);
    fx = f(x);
    Q = Q+h*(fx*w);
  endfor
endfunction
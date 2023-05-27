function Q = intNCCompuesta(f,a,b,L,n)
  
  y = linspace(a,b,L+1);
  h = (b-a)/L;
  # Calculamos los pesos con pesosNC.m
  w = pesosNC(n);
  Q = 0;
  for i=1:L
    x =linspace(y(i),y(i+1),n);
   % hQ = y(i+1) - y(i);
    fx = f(x);
    Q = Q + h*(fx*w);
  endfor
endfunction

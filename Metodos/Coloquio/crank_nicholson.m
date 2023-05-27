function [x y] = crank_nicholson(f,a,b,L,y0)
  h = (b-a)/L;
  x = linspace(a,b,L+1);
  y(1) = y0;

  for i = 1:L
    y(i+1) = y(i) + (h/2)*(f(x(i),y(i)) + f(x(i),y(i+1)));
  endfor
  
  %y(2:L+1) = y(1:L) + h*f(x(1:L),y(1:L));
endfunction
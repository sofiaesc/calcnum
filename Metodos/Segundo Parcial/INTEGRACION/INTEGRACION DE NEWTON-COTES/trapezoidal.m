function [S] = trapezoidal(y,a,b)
  h = (b-a); 
  S = (h/2)*(y(a) + y(b));
endfunction

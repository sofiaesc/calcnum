function [t w] = euler(F,a,b,L,y0)
  h = (b-a)/L;
  t = linspace(a,b,L+1);
  n = length(y0);
  w = zeros(n,L);
  w(:,1) = y0;
  
  for i = 1:L
       w(1:n,i+1) = w(1:n,i) + h*(F(t(i),w(1:n,i))(:));
  endfor
  
endfunction
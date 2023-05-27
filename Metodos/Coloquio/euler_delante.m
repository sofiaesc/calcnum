function [x y] = euler_delante(f,a,b,L,y0)
  h = (b-a)/L;
  x = linspace(a,b,L+1);
  n = length(y0);
% y = zeros(1,L+1);
  y(:,1) = y0;
 
  for i = 1:L
    y(1:n,i+1) = y(1:n,i) + h*(f(x(i),y(:,i))(:));
  endfor
  
  %y(2:L+1) = y(1:L) + h*f(x(1:L),y(1:L));
endfunction
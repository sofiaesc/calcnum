function [a b c d] = cubic_spline_clamped(x,y,fpo,fpn)
  n = length(x);
  v = zeros(n,1);
  
  
  c = v;
  
  h(1:n-1) = x(2:n) - x(1:n-1);
  
  v(1) = 3*(y(2)-y(1))/h(1) - 3*fpo;
  v(n) = 3*fpn - 3*(y(n)-y(n-1))/h(n-1);
  
  v(2:n-1) = (3./h(2:n-1)).*(y(3:n)-y(2:n-1)) - (3./h(1:n-2)).*(y(2:n-1)-y(1:n-2));
 
  L = zeros(n,1);
  U = zeros(n,1);
  Z = zeros(n,1);
  
  L(1) = 2*h(1);
  U(1) = 0.5;
  Z(1) = v(1)/L(1);
  
  for i = 2:n-1
    L(i) = 2*(x(i+1) - x(i-1)) - h(i-1)*U(i-1);
    U(i) = h(i)/L(i);
    Z(i) = (v(i) - h(i-1)*Z(i-1))/L(i); 
  endfor
  
  L(n) = h(n-1)*(2-U(n-1));
  Z(n) = (v(n) - h(n-1)*Z(n-1))/L(n);
  c = Z;
  
  
  for i = n-1:-1:1
    c(i) = Z(i) - U(i)*c(i+1);
    b(i) = (y(i+1) - y(i)) / h(i) - h(i)*(c(i+1) + 2*c(i)) / 3;
    d(i) = (c(i+1) - c(i)) / (3*h(i));
  endfor
  
  a = y(1:n-1);
  c = c(1:n-1)'; 
endfunction
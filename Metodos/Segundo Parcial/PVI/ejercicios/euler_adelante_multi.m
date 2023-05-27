function [x,w] = euler_adelante_multi(f,a,b,y0,N) 
  h = (b-a)/N; 
  x = [a:h:b]; 
  w = zeros(length(y0), N+1); 
  w(:,1) = y0; 
   
  for n = 1:N 
    w(:,n+1) = w(:,n) + h*f(x(n),w(:,n)); 
  endfor 
endfunction
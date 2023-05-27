function [L U] = crout(A)
  n = length(A(:,1);
  L(1:n,1) = A(1:n,1);
  U(1:n,1:n) = 1;
  
  U(1,2:n) = A(1,2:n)/L(1,2:n); 
  
  for i = 2:n
    L(2:n,2:i) = A(2:n,2:i) - L(2:n, 1:);
  endfor
  
  
  
endfunction
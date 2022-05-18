function [L,U] = fact_doolitle(A)
  
  n = length(A(1,:));
  
  for k= 1:n-1
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n)
  endfor
  
  L = eye(n) + tril(A,-1)
  U = triu(A);
  
endfunction

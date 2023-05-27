function [M,b] = matrix_CSN(x,f)
  
  # Armamos todo como un sistema A*x = b
  n = length(x);
  M = zeros(n,n);
  
  Mm = M; # Matriz principal
  b = zeros(n,1); # lado derecho
  # Espaciamiento.
  h =x(2:n)-x(1:n-1);
  b(2:n-1) = 3*(f(3:n)-f(2:n-1))./h(2:n-1) - 3*(f(2:n-1)-f(1:n-2))./h(1:n-2);
  
  # valores de la diagonal principal
  dp = ones(n,1);
  dp(2:n-1) = 2*(h(1:n-2) + h(2:n-1));
  
  # Valores diagonal inferior
  M(2:n-1,1:n-2) = diag(h(1:n-2));
  
  # Valores diagonal superior
  Mm(2:n-1,3:n) = diag(h(2:n-1));
  
  # Armamos toda la matriz
  
  M = M + Mm + diag(dp);
  
endfunction

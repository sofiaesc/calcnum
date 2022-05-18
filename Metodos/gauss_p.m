function [x] = gauss_p(A,b)
  % Elimiancion de Gauss con pivoteo
  
  n=length(b);
  A=[A b]; % matriz aumentada
  r=[1:n]';
  epsilon=1e-9;
  for k=1:n-1
  % la funcion max devuelve
% pmax: el pivote de mayor valor absoluto
% p: posicion donde se encuentra pmax (local)
  [pmax,p] = max(abs(A(r(k:n),k)));
    if pmax<epsilon
      disp('Los posibles pivots son CERO')
      break
    endif
  p = p+k-1; %actualizamos pos. a numeracion global
    if p~=k
      r([p k])= r([k p]); %actualiza el pivote
    endif
    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
    A(r(k+1:n),k+1:n+1) = A(r(k+1:n),k+1:n+1)-...
    A(r(k+1:n),k)*A(r(k),k+1:n+1);
  endfor

  % calculo de la soluci�n
  
x = sust_atras_p(A(r,:));
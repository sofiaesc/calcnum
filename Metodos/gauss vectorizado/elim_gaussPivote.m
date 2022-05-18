function [x,P] = elim_gaussPivote(A,b)
% Calculo del algoritmo de eliminacion de Gauss con intercambio de
% renglones Pivoteo Parcial (Matriz Pivote (P) y mayor valor de pivote

%tic();
n = length(A(1,:));
P = eye(n,n); % matriz Pivote Inicial coincide con la matriz I

for k=1:n
    [val,p] = max(abs(A(k:n,k))); % busca el maximo valor absoluto 
                                  % incluyendo el pivot sobrre todos los
                                  % valores de la columna k debajo del
                                  % pivote
    p = p(1) + k-1; % actualizo posicion del pivote
    % Ahora intercambiamos filas
     A([k,p],:) = A([p,k],:); % matriz
     b([k,p]) = b([p,k]); % Termino lado derecho
     P([k,p],:) = P([p,k],:); % Actualizamos la matriz de intercambio
     
     % Ahora estamos en condiciones de seguir con la eliminacion de gauss
     
     m = A(k+1:n,k)/A(k,k);
     A(k+1:n,k:n) = A(k+1:n,k:n) - m*A(k,k:n);
     b(k+1:n) = b(k+1:n) - m*b(k);
end

x = sust_atras_op(A,b,n);
  
%time = toc();
    



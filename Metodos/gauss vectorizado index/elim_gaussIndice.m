function [x,Indice] = elim_gaussIndice(A,b)
% Calculo del algoritmo de eliminacion de Gauss con intercambio de
% filas usando Indice evitando el intercambio de filas
% function [x,Indice,tiempo] = elim_gaussIndice(A,b) cuando medimos el
% tiempo

%tic();
n = length(A(1,:));
Indice = [1:n];

for k=1:n
    [~,p] = max(abs(A(Indice(k:n),k))); % busca el maximo valor absoluto 
                                  % incluyendo el pivot sobrre todos los
                                  % valores de la columna k debajo del
                                  % pivote
    p = p(1) + k-1; % actualizo posicion del pivote
    % Ahora intercambiamos filas con el vector Indice
    Indice([k,p]) = Indice([p,k]); % Intercambio en el vector Indice
    m = A(Indice(k+1:n),k)/A(Indice(k),k);
    A(Indice(k+1:n),k:n) = A(Indice(k+1:n),k:n) - m*A(Indice(k),k:n);
    b(Indice(k+1:n)) = b(Indice(k+1:n)) - m*b(Indice(k));
end

x = sust_atras_Indice(A,b,Indice,n);
  
%tiempo = toc();
    



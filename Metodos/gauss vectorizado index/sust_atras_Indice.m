function x = sust_atras_Indice(A,b,Indice,n)
% proceso de sustitucion hacia atrás con indice

x = zeros(n,1); % inicializamos la solucion
x(n) = b(Indice(n))/A(Indice(n),n); % primer calculo con la ultima ecuacion

for i=n-1:-1:1 % ojo importante el -1 de paso porque sino no reconoce
               % que tiene que ir hacia atrás ej: n=50 i = 49:1, interpreta
               % que el paso es 1 entonces el siguiente numero es 50 y
               % deberia ser 48 y no sigue
    
    x(i) = (b(Indice(i)) - A(Indice(i),i+1:n)*x(i+1:n))/A(Indice(i),i);
    
end % for i


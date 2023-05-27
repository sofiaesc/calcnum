function x = sust_adelante_Indice(L,b,Indice,n)
% proceso de sustitucion hacia adelante con Indice
% A representa la matriz triangular inferior, b el termino del lado
% derecho de Ax=b, Indice un arreglo del movimientos de intercambios y n el
% numero de filas y columnas de A

x = zeros(n,1); % inicializamos la solucion
x(1) = b(Indice(1))/L(Indice(1),1); % primer calculo con la primera ecuacion

for i=2:n % variacion del indice i para calcular el resto de los componentes
          % de la solucion
    
    x(i) = (b(Indice(i)) - L(Indice(i),1:i-1)*x(1:i-1))/L(Indice(i),i);
    
end % for i


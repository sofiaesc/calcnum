function x = sust_adelante_op(L,b,n)
% proceso de sustitucion hacia adelante vectorizada
% A matrix del sistema Ax=b, b vector del lado derecho y n: nro de
% componentes de filas y columnas de A.
% L: matriz triangular inferior
% U: matriz triangular superior

x = zeros(n,1); % inicializamos la solucion
x(1) = b(1)/L(1,1); % primer calculo con la primera ecuacion

for i = 2:n % variacion del indice para calcular el resto de los componentes
               % vector solución.
    
    x(i) = (b(i) - L(i,1:i-1)*x(1:i-1))/L(i,i);
    
end % for i
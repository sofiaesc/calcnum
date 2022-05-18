function [x] = eliminacion_gauss_Vec(A1, b);
% programación con lazos o bucles, sin pivoteo
% calculo del sistema Ax=b;
% me dan resultados con menor tiempo de calculo
% la paso como datos la matriz del sistema Ax=b
% puedo armar una matriz ampliada o no. Aamp=[A1 b];

n = length(A1(:,1));
% aca no generamos la matriz aumentada sino lo hacemos por separado (a y b)
for k = 1:n % representa la diagonal donde estan los pivotes
    m = A1(k+1:n,k)/A1(k,k); % m ---> vector columna
    b(k+1:n) = b(k+1:n) - m*b(k); 
    A1(k+1:n,k+1:n) = A1(k+1:n,k+1:n) - m*A1(k,k+1:n); % (k+1:n,1)*(1,k+1:n)--->(k+1:n,k+1:n)
             
       
   #for i= k+1:n  % indice representando las columnas
     #  m = A1(i,k)/A1(k,k);
     #  b(i) = b(i) - m*b(k); 
     #  A1(i,k+1:n) = A1(i,k+1:n) - m*A1(k,k+1:n); % ojo A1(k,k+1:n)*m da un escalar
     #  for j = k+1: n
     #      A1(i,j) = A1(i,j) - m*A1(k,j);
     #  end % j
   #end % i
end %k

[x] = sust_atras_op(A1,b,n)

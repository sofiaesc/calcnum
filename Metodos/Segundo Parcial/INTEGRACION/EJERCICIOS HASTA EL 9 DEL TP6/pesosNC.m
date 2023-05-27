function w = pesosNC(n)
  % Funcion que calculo los pesos de las
  # reglas de cuadratura numerica para Newton-Cotes de "n" puntos.
  
  x = linspace(0,1,n);
  
  A = ones(n,n);
  
  for i = 2: n
    A(i,:) = A(i-1,:).*x;
  end
  
  b= 1./(1:n)';
  
  w =A\b;
endfunction

  


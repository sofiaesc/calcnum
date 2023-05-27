function Q = trapcomp(x,y)
  % Regla del trapecio compuesta para aproximar la integral
  % de una función f en el intervalo [x(1), x(end)]. Se supone
  % que y(i) = f(x(i))
  
  % Calculamos la cantidad de subintervalos
  L = numel(x)-1;
  % Calculamos el vector que tiene la longitud de cada uno de los 
  % L subintervalos.
  
  % la función diff da un vector con una componente menos de x, es 
  % decir la diferncia entre dos valores consecutivos
  deltax = diff(x); % deltax(i) = x(i+1) - x(i). Contiene h1.h2,h3....
  
  % Aplicamos la regla del trapecio en cada intervalo 
  % [x(i), x(i+1)] , para i=1,2,3,....,L
  Q = 0; % Inicializamos la variable  
  for i=1:L
    Q = Q + 0.5*deltax(i).*(y(i+1)-y(i));
  endfor
  
endfunction
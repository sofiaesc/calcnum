function Q = SimpsonComp(x,y)
  
  % Aplicamos la regla de simpson compuesta para aproximar la integral de uname
  % función f en el intervalo [x(1), x(end)]. Suponemos que y(i) = f(x(i))
  % y que los puntos x(i) estan equiespaciados y que son una cantidad IMPAR
  % OJO CON ESTO.
  
  % calculamos la cantidad de subintervalos
  
  L = numel(x)-1;
  
  % Testeamos que haya una cantidad par de subintervalos o impar de datos.
  
  if rem(L,2)
    % Fijarse en la linea de comando que nos devuelve rem(L,2) para distintos L
    % da 1 si es impar y cero(0) si es par.
    disp('Warning: Tiene que darnos una cantidad impar de datos')
    Q = NaN;
    return
  endif
  
  % Para aplicar la regla de simpson Compuesta en L/2 intervalos consecutivos
  % necesitamos la longitud de cada intervalos
  
  h=(x(end)-x(1))/(L/2);
  
  % Ahora aplicamos la regla de Simpson compuesta.
  % para entender lo siguiente planterlo en papel comonos queda la formula
  % ver la teoria.
  
  Q = h/6*(y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
  
  

function S = SimpsonCompDatos(x,y) 
  %Regla de Simpson Compuesto dado los datos x,y 
 N = length(x); %Se supone impar 
 h = (x(N) - x(1))/(N-1); %Calculamos el h 
   
 S0 = y(1) + y(N); %f(a) + f(b) 
 S1 = 0; %Parte par 
 S2 = 0; %Parte impar 
   
 for i = 2:(N-1) %Desde 2 hasta n-1 
 r = mod(i,2); %Chequeo si la iteración es par o impar 
    if (r == 0) 
 S1 += 4*y(i); %Si es par, la sumo a S1 
    else 
 S2 += 2*y(i); %Si es impar, la sumo a S2 
    endif 
  endfor 
   
 S = h*(S0 + S1 + S2)/3; %Calculo el S final. 
   
endfunction 
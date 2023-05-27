function [S] = crear_spline(M,xi)
# M -> matriz con los coeficientes obtenidos de la funcion spline de forma
# M = [d' c' b' a']
#
# xi -> vector con los puntos x0, x1, ..., xn de base para el spline
  
  n = length(xi)-1;
  
  S = @(x) M(1,4)*(x==xi(1));
  
  for i = 1:n
    #dM = polyder(M(i,:);
    S = @(x) S(x) + ...
    polyval(M(i,:), (x-xi(i))).* (x>xi(i)).* (x<=xi(i+1));
  endfor
  
  
  
endfunction
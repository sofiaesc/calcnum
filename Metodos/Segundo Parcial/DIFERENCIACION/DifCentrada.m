# Integracion Cap.6 Diferenciacion.
# Regla de tres puntos (Centrada)

function [df, h] = DifCentrada(f,x0,hmin,hmax,n)
  h = linspace(hmin,hmax,n);
  fx0 = f(x0);
  fx1 = f(x0-h);
  fx2 = f(x0+h);
  
  df = (fx2-fx1)./(2*h);
 
endfunction
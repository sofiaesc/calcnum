
function y = AdamsBashfortMoulton (f,t,y0)
#recibimos la función "f", los puntos en los que la evaluamos "t", y la condicion inicial y0

y(:,1) = y0;
N = length(t)-1;            #sub intervalos
h = t(2) - t(1);            #tamanio del paso

#Runge kutta
for n=1:3
  k1 = h * f(t(n) , y(:,n));
  k2 = h * f(t(n)+h/2 , y(:,n)+k1/2);
  k3 = h * f(t(n)+h/2 , y(:,n)+k2/2);
  k4 = h * f(t(n+1) , y(:,n)+k3);
  
  y(:,n+1) = y(:,n) + (k1+2*k2+2*k3+k4)/6;
endfor

#Como runge kutta calculo los primeros 3 valores, arrancamos desde n = 4

for n=4:N
  #Adams bashfort predictor 4 pasos
  y(:,n+1) = y(:,n) + (h/24) * (55*f(t(n),y(:,n))...
  -59*f(t(n-1),y(:,n-1))...
  +37*f(t(n-2),y(:,n-2))...
  -9*f(t(n-3),y(:,n-3)));
  
  #Adams moulton corrector 3 pasos
  y(:,n+1) = y(:,n) + (h/24)*(9*f(t(n+1),y(:,n+1))...
  +19*f(t(n),y(:,n))...
  -5*f(t(n-1),y(:,n-1))...
  +f(t(n-2),y(:,n-2)));  
  
endfor

endfunction

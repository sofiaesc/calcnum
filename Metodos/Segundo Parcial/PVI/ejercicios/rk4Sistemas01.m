function [t,U] = rk4Sistemas01(F,a,b,Ua,M)
  # F: sistema de ecuaciones : funcion almacenada como cadena de caracteres
  # a: limite izq de la variable t
  # b: limite der de la variable t
  # Ua=[u1(a),.... un(a)]
  # Ua Sistema de valores iniciales (ui(a) = alphai)
  # M: cantidad de subintervalos
  # Resultados:
  # T: vector de los nodos.
  # U =[u1(t),......un(t)] donde ui(t) es la aproximacion a la i-esima variable
  # dependiente
  
  h = (b-a)/M;
  %t = zeros(1,M+1);
  U = zeros(length(Ua),M+1); % reservamos memoria
  t = [a:h:b]; % discretizamos el tiempo
  U(:,1) = Ua; # condiciones iniciales
  for j = 1:M
   k1 = h * F(t(j)  , U(:,j));
   k2 = h * F(t(j)+h/2, U(:,j)+k1/2);
   k3 = h * F(t(j)+h/2, U(:,j)+k2/2);
   k4 = h * F(t(j)+h, U(:,j)+k3);
   U(:,j+1) = U(:,j) + (1/6)*(k1 +2*k2+2*k3+k4);
  endfor
  
endfunction

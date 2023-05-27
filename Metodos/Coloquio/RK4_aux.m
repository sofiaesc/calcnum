function [t w] = RK4_aux(f,a,b,L,w0,c)
  # Metodo de Runge-Kutta de orden 4 pero solo calcula c valores de w
  h = (b-a)/L;
  t = linspace(a,b,L+1);
  n = length(w0);
  w = zeros(n,L);
  w(:,1) = w0;
  
  for i = 1:c
    k1 = h*(f(t(i),w(:,i))(:));
    k2 = h*(f(t(i)+h/2 , w(:,i)+k1(:)./2)(:));
    k3 = h*(f(t(i)+h/2 , w(:,i)+k2(:)./2));
    k4 = h*(f(t(i)+h , w(:,i)+k3(:)));

    w(1:n,i+1) = w(1:n,i) + (1/6)*(k1(1:n) + 2*k2(1:n) + 2*k3(1:n) + k4(1:n));
  endfor
  
endfunction
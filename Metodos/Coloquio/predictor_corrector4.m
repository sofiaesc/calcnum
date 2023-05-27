function [t w] = predictor_corrector4(F,a,b,L,w0)
  h = (b-a)/L;
  t = linspace(a,b,L+1);
  n = length(w0);
  w = zeros(n,L);
  [~, w] = RK4_aux(F,a,b,L,w0,4);
  
  for i = 4:L
    #predictor
    w(:,i+1) = w(:,i) + (h/24)*( 55*F(t(i),w(:,i)) - 59*F(t(i-1),w(:,i-1))...
    + 37*F(t(i-2),w(:,i-2)) - 9*F(t(i-3),w(:,i-3)) );
    #corrector
     w(:,i+1) = w(:,i) + (h/24)*( 9*F(t(i+1),w(:,i+1)) + 19*F(t(i),w(:,i))...
    - 5*F(t(i-1),w(:,i-1)) + F(t(i-2),w(:,i-2)) );
  endfor
endfunction
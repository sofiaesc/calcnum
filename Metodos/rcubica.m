function [r t] = rcubica(n)
  tic();
  f = @(x) (x^3-n);
  tol = 10^-12;
  a = 0;
  b = 1000;
  maxit = 100;
  [r basura basura2 basura3] = biseccion(f,a,b,maxit,tol);
  t = toc();
endfunction
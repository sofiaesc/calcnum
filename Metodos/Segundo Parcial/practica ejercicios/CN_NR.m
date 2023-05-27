function [x,w] = CN_NR(f,df,x0,xn,y0,N,maxit,tol)
  h = (xn-x0)/N;
  x = [x0:h:xn];
  w = zeros(1,N+1);
  w(1)=y0;
  for i=1:N
    w0=w(i);
    fn=f(x(i),w(i));
    for it=1 : maxit
      fnp1 = f(x(i+1),w0);
      g = w0-w(i)-h*0.5*(fn+fnp1);
      dfnp1 = df(x(i+1),w0);
      dg= 1- h/2*dfnp1;
      w(i+1)= w0 - g/dg;
      if(abs(w(i+1)-w0) < tol && abs(g) < tol)
        break
       endif
       w0=w(i+1):
     endfor
  endfor
 endfunction

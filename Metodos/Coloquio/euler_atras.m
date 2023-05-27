function [t y] = euler_atras(f,dfdy,a,b,L,y0,maxit,tol)
  h = (b-a)/L;
  t = [a:h:b];
  y = zeros(1,L+1)';
  y(1) = y0;
  
  for i = 1:L
    w0 = y(i);
    for it = 1:maxit
      fm1 = f(t(i+1),y(i+1));
      dfm1 = dfdy(t(i+1),y(i+1));
      g = w0 - y(i) - h*fm1;
      dg = 1 - h*dfm1;
      y(i+1) = w0 - g/dg;
      if abs(y(i+1)-y0) < tol
        break;
      endif
      w0 = y(i+1);
    endfor
    y(i+1) = y(i) + h*f(t(i+1),y(i+1));
  endfor
endfunction  
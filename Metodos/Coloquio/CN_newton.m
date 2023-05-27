function [t y] = CN_newton(f,dfdy,a,b,L,alpha,maxit,tol)
  h = (b-a)/L;
  t = [a:h:b]';
  y = zeros(L+1,1);
  y(1) = alpha;
  
  for i = 1:L
    y0 = y(1);
    fi = f(t(i),y(i));
    
    for it = 1:maxit
      fim1 = f(t(i+1),y0);
      dfim1 = dfdy(t(i+1),y0);
      g = y0 - y(i) - h*0.5*(fi+fim1);
      dg = 1 - h*0.5*dfim1;
      y(i+1) = y0 - g/dg;
      if (abs(y(i+1)-y0) < tol)
        break;
      endif
      y0 = y(i+1);
    endfor
    
    y(i+1) = y(i) + (h/2)*(fi+f(t(i+1),y(i+1)));
  endfor
  
  
endfunction
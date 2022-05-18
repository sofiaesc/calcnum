function [p, rh, it, t] = biseccion(f, a, b, maxit, tol)
 %[p, rh, it, tiempo,nitmin] = biseccion(f, a, b, maxit, tol)
  tic()
 % nitmin = log((b-a)/tol)/log(2)
  fa = f(a);
  fb = f(b);
  if sign(fa)*sign(fb) > 0
    error('No se cumple la regla de los signos y el TVN');
  endif
   it = 0;
   while (it < maxit)
    it++;
    p = a + (b-a)/2;
    fp = f(p);
    rh(it) = abs(fp);
    if (rh(it) < tol)
      break;
    endif
    if (sign(fp)*sign(fb) < 0)
      fa = fp;
      a = p;
     else
      fb = fp;
      b = p;
    endif 
   endwhile
  t = toc();
       
endfunction

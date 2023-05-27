function [p r_h it t] = biseccion(f, a, b, maxit, tol)
  tic();
  fa = f(a);
  fb = f(b);
  if sign(fa)*sign(fb) > 0
    error('No se cumplen las condiciones para aplicar este metodo')
  endif
  it = 0;
  while it<maxit
    ++it;
    p = a + (b-a)/2; %Se calcula p
    fp = f(p);
    
    if sign(fp)*sign(fb)<0
      r_h(it)= abs(a-p); #error absoluto
     # r_h(it) = max(abs([fp,b-p]));
      fa = fp;
      a = p;
    else
       r_h(it)= abs(b-p); #error absoluto
     # r_h(it) = max(abs([fp,a-p]));
      fb = fp;
      b = p;
    endif
    
    if r_h(it) < tol
      break;
    endif
    
  endwhile
  t = toc();
endfunction  
function [p r_h it t] = regula_falsi(f, a, b, maxit, tol)
  tic();
  fa = f(a);
  fb = f(b);
  it = 0;
  
  while it<maxit
    p = b - fb*(b - a)/(fb - fa);
    fp = f(p);
    
    if sign(fp)*sign(fb)<0
      r_h(it+1) = max(abs([fp,b-p]));
      fa = fp;
      a = p;
    else
      r_h(it+1) = max(abs([fp,a-p]));
      fb = fp;
      b = p;
    endif
     
    if r_h(it+1) < tol
      break;
    endif
    
    ++it;
  endwhile
  
  if it == maxit
    str = ['No converge en ' maxit ' iteraciones.'];
    disp(str)
  endif
  t = toc();
  
endfunction
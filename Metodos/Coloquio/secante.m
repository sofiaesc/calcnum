function [x r_h it t] = secante(f, x0, x1, maxit, tol)
  tic();
  f0 = f(x0);
  f1 = f(x1);
  it = 0;
  
  while it<maxit
    x = x1 - f1*(x1 - x0)/(f1 - f0);
    r_h(it+1) = abs(x-x1); 
    if r_h(it+1) < tol
      break;
    endif
    x0 = x1; f0 = f1;
    x1 = x; f1 = f(x);
    ++it;
  endwhile
  

  t = toc();
  
endfunction
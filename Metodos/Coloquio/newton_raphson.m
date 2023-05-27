function [x r_h it t] = newton_raphson(f, df, x0, maxit, tol)
  tic();
  it = 0;
  
  while it<maxit
    x = x0 - f(x0)/df(x0);
    %r_h(it+1) = abs(x-x0);# error absoluto
    r_h(it+1) = abs(x-x0)/abs(x); # error relativo
    if r_h(it+1)<tol*abs(x)
      break;
    endif
    x0 = x;
    ++it;
  endwhile 
  
  
  t = toc();
endfunction
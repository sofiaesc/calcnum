function [a b] = intervalo_f(f)
  a = 0;
  b = 1;
  
  while sign(f(a))*sign(f(b)) > 0
    b = b*2
  endwhile
endfunction
function [dx h] = aprox_dx_2PP(f, x0, exp_min, exp_max)
  h = 10.^[exp_min:exp_max];
  dx = (f(x0+h) - f(x0))./h;
endfunction
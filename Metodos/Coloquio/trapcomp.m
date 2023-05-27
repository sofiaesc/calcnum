function I = trapcomp(x,y)
 #{ 
 L = length(x) - 1;
  I = 0;
  for i = 1:L
    h = x(i+1) - x(i);
    yi1 = y(i);
    yi2 = y(i+1);
    
    S = (h/2)*(yi1 + yi2);
    I = I + abs(S);
  endfor 
  #}
  
  n = length(x);
  I = 0;
  for i = 1:n-1
    h = x(i+1) - x(i);
    I += h*(y(i+1) + y(i));
  endfor
  I /= 2;
endfunction
function w = pesosNC(n)
  x = linspace(0,1,n);
  A = ones(n,n);
  for i = 2:n
    A(i,:) = A(i-1,:).*x;
  endfor
  b = 1./(1:n)';
  
  w = A\b;
endfunction  
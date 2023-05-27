function J = int_doble_gauss(f,a,b,c,d,m,n) 
  %integral de afuera entre a y b, la de dentro entre c y d.
  h1 = (d-c)/2;
  h2 = (d+c)/2;
  J = 0;
  [xgm wm] = gauss_xw(m);
  [xgn wn] = gauss_xw(n);
  
  for i = 1:m
    Jx = 0;
    x = h1*xgm(i) + h2;
    k1 = (b-a)/2;
    k2 = (b+a)/2;
    for j = 1:n 
      y = k1*xgn(j) + k2;
      Q = f(x,y);
      Jx += wn(j)*Q;
    endfor
    J = J + wm(i)*k1*Jx;
  endfor
  
  J = h1*J;

endfunction
function [a,b,c,d]= cubic_spline_natural(x,f)
  n=length(x);
  for i=1:n
  a(i)=f(x(i));
  endfor
  for i = 1:n-1
  h(i)=x(i+1)-x(i);  
  endfor
for i =2 :n-1
 alfa(i)=(((3/h(i))*(a(i+1)-a(i)))-((3/h(i-1))*(a(i)-a(i-1)))); 
endfor
l(1)=1; u(1)=0; z(1)=0;
for i =2 :n-1
l(i)=2*(x(i+1)-x(i-1))-h(i-1)*u(i-1) ;
u(i)=h(i)/l(i);
z(i)=((alfa(i)-(h(i-1)*z(i-1)))/l(i)); 
endfor
l(n)=1;z(n)=0;c(n)=0;
for j =(n-1):-1:1  # ESTA LINEA CORREGI - ESTABA MAL EL LAZO 
c(j)=(z(j)-(u(j)*c(j+1)));

b(j)=(((a(j+1)-a(j))/h(j)) -((h(j)*(c(j+1)+(2*c(j))))/3));
d(j)=((c(j+1)-c(j))/(3*h(j)));
endfor
a = f(1:n-1); # ESTA LINEA AGREGUE

c = c(1:n-1); # ESTA LINEA AGREGUE
endfunction
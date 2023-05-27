function[a,b,c,d] = Spline_Cubico_Sujeto(x, y, dy0, dyn)
n=length(x);
h(1:n-1)=x(2:n)-x(1:n-1);

v=zeros(n,1);
v(1)=3*((y(2)-y(1))/h(1)-dy0);
v(2:n-1)=3*((y(3:n)-y(2:n-1))./h(2:n-1)-(y(2:n-1)-y(1:n-2))./h(1:n-2)); 
v(n)=3*(dyn-(y(n)-y(n-1))/h(n-1));

l(1)=2*h(1); 
u(1)=0.5;
z(1)=v(1)/l(1);

for i=2:n-1
  l(i)=2*(x(i+1)-x(i-1))-h(i-1)*u(i-1);
  u(i)=h(i)/l(i);
  z(i)=(v(i)-h(i-1)*z(i-1))/l(i);
endfor

l(n)=h(n-1)*(2-u(n-1));
z(n)=(v(n)-h(n-1)*z(n-1))/l(n);
c(n)=z(n);
for i=n-1:-1:1
  c(i)=z(i)-u(i)*c(i+1);
  b(i)=(y(i+1)-y(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3;
  d(i)=(c(i+1)-c(i))/(3*h(i));
endfor
  c=c(1:n-1);
  a=y(1:n-1);
endfunction
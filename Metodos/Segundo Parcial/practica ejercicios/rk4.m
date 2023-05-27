function [t,y] = rk4(dydt, intervalo, y0, L)
  y0=y0(:);

  m=size(y0,1);
  t=zeros(L+1,1);
  y=zeros(L+1,m);

  a=intervalo(1);
  b=intervalo(2);
  h=(b - a)/L;

  t(1,1)=intervalo(1);
  y(1,:)=y0(:);

  for i = 1 : L
    f1=dydt(t(i,1),y(i,:));
    f2=dydt(t(i,1)+h*0.5, y(i,:)+h*f1'*0.5);
    f3=dydt(t(i,1)+h*0.5, y(i,:)+h*f2'*0.5);
    f4=dydt(t(i,1)+h, y(i,:)+h*f3');

    t(i+1,1)=t(i,1)+h;
    y(i+1,:)=y(i,:)+h*(f1'+2.0*f2'+2.0*f3'+f4')/6.0;
  end
end
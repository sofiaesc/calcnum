function [x,y]=disparo_lineal(f,a,b,yc,L)
%function [x,y]=disparo_lineal(f,[a b],[alpha,beta],L)
  %Metodo del disparo lineal que resuelve
  %el problema de valores de contorno lineal con
  %condiciones Dirichlet
  %usando Runge-Kutta
  % y’’ = p(x)y’ + q(x)y + r(x) para x en [a,b]
  % y(a)=alpha , y(b)=beta
  %f: funcion columnas con las funciones p,q,r
  %L: cantidad de subintervalos
  
  p=@(x) f(x)(:,1);
  q=@(x) f(x)(:,2);
  r=@(x) f(x)(:,3);
  
  %costruye sistema
  F=@(x,y) [y(3);
            y(4);
            p(x)*y(3)+q(x)*y(1)+r(x);
            p(x)*y(4)+q(x)*y(2)+r(x)];
            
  %define condiciones iniciales del sistema
  y0=[yc(1);yc(1);0;1];
  
  [x,yd]=RK4(F, a, b, L, y0);
  
  lambda=(yc(2)-yd(2,end))/(yd(1,end)-yd(2,end));
  y=lambda*yd(1,:)+(1-lambda)*yd(2,:);
endfunction
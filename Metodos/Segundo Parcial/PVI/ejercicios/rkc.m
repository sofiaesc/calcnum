function [t,y]=rkc(f,a,b,y0,n)
% Resuelve mediante el método Runge-Kutta clásico el PVI dado por y
0 = f (t,y),
y(0) = y0 en el intervalo [a,b].
% n es el número de pasos
h=(b-a)/n;% paso
m=length(y0);
y=zeros(m,n+1);
t=a+h*(0:n); y(:,1)=y0’;
for i=1:n
k1=feval(f,t(i),y(:,i));
k2=feval(f,t(i)+h/2,y(:,i)+h/2*k1);
k3=feval(f,t(i)+h/2,y(:,i)+h/2*k2);
k4=feval(f,t(i)+h,y(:,i)+h*k3);
y(:,i+1)=y(:,i)+h/6*(k1+2*k2+2*k3+k4);
end
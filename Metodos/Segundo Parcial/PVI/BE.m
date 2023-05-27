function [t,w]=BE(ecua,alfa,a,b,N)
h=(b-a)/N;
t=(a:h:b)’;
kmax=100;
tol=1e-6;
w=zeros(N+1,1);
n=1;
w(n)=alfa;
while(n<N+1)
k=1;
while(k<kmax)
[fnp1,dfnp1dy]=feval(ecua,t(n),w(n));
g = w(n+1) + w(n) + h*fnp1;
dgdy = 1 - h*dfnp1dy;
w(n+1) = w(n+1) - g/dgdy;
if abs(g)<tol break; endif
k=k+1;
endwhile
n=n+1;
endwhile
endfunction
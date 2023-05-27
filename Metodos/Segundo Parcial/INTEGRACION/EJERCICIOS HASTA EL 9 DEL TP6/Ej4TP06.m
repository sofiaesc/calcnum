  clear all;
  clc;
  clf;
  %========================
  %f = @(x) (sin(pi.*x));
  %Iex = 2/pi;
  %a = 0; b=5;
  %========================
  f = @(x) (1./(1+x.^2));
  Iex = atan(5) - atan(-5);
  a = -5; b=5;
  %========================
  n = 20; # nro de puntos.
  L=1;
  h = (b-a)/(n-1);
  S = zeros(n-1,1);
  for i = 1:n-1
  [Q] = intNCCompuesta(f,a,b,L,i+1);
   S(i) = Q;
  end
  Col = abs(Iex - S)
  np=[2:n]
  x =[1:n-1];
 
  
  figure(1)
  plot(np,Col,'r-o','linewidth',3);
  grid on
  grid minor
  xlabel('Nro. Puntos')
  ylabel('Error absoluto')
  
  %Generacion de polinomio segun la cantidad de puntos
  
  ptos = n
  xd = linspace(a,b,ptos)
  yd = f(xd)
  L=length(xd)
  %for i = 1:ptos
   % xd(i) = a + h*(i-1);
   % yd(i) = f(xd(i));
  %endfor
  
 % [P, L] = PolIntLagrange(xd, yd);
 % pnew = @(x) polyval(P,xd);
 % xx = linspace(a,b,201);
 % figure(2)
 % plot(xx,f(xx),'k','linewidth',2, xx,pnew(xx),'r','linewidth',2)
  %grid on
  
  cp = polyfit(xd,yd,ptos-1);
  xx = linspace(a,b,201);
  pnew = polyval(cp,xx);
  
  
  figure(2)
  plot(xx,f(xx),'k','linewidth',2, xx,pnew,'r-o','linewidth',2)
  grid on
  grid minor
  xlabel('Intervalo en X')
  ylabel(' f(x) - p(x)')
  le1=sprintf('f(x)');
  le2=sprintf('Polinomio de grado: %2i',ptos-1);
  legend(le1,le2)
  
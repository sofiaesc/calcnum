# Calculo Octave solucion ODE
clear all;
clc
#f = @(t,y) y-(t^2)+1;
f = @(t,y) -y + sin(t) + cos(t);
y0 = 0; % Condicion Inicial

# Calculamos la ODE; utilizando la función de Octave
%[t,y] = ode45(f,[0,2],y0);
% solucion analitica
y=@(t) sin(t);
tt=linspace(0,2,201);
yy=y(tt);
figure(1)
plot(tt,yy,'r-*')
grid on
grid minor
hold on

% determinamos los subintervalos de la variable t
r=2; j=[1:8];
c=10;
L=c.*r.^(j)';
h=1/L;
N=length(L);
weuler=zeros(size(N));
w1RK2=zeros(size(N));
w2RK4=zeros(size(N));

for i= 1:N
#===============================
[t,w] = euler(f,[0,5],y0,L(i));
weuler(i) = w(L(i)+1);
%plot(t,w,'b-o')
#===============================
[t,w1]=rk2(f,[0,5],y0,L(i));
#w12 = w1(80)
w1RK2(i)=w1(L(i)+1);
%plot(t,w1,'k--o')
#===============================
[t,w2]=rk4(f,[0,5],y0,L(i));
w2RK4(i)=w2(L(i)+1);
%plot(t,w2,'g-o')
#===============================
end

format short g
Sol=[L weuler' w1RK2' w2RK4']

% Graficamos en el tiempo t=L+1
plot(t,w,'b-o')
plot(t,w1,'k--o')
plot(t,w2,'g-o')

title('PVI-ODE Euler-rk2-rk4')
xlabel('Tiempo [s]')
ylabel('Solucion ODE')
legend('Analitica', 'Euler', 'rk2','rk4')
hold off
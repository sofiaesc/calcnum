#Ej1_GTP6.m
clear all, clc, clf
f = @(x) exp(x)-2*x.^2+3*x-1; % función del Ej1

df = @(x) exp(x)-4*x + 3; % valor analitico

ddf = @(x) exp(x)-4; 
x0=0.0;
exp_min = -11;
exp_max = -1;
x=linspace(-1,5,201);

figure(1)
plot(x,f(x),'b-')
hold on
plot(x0,f(x0),'ro')
grid on
grid minor
xlabel('X')
ylabel('f(x)')
title('Grafica de la función')
plot(x,ddf(x),'m-*')
le1=sprintf('f(x)');
le2=sprintf('punto x0');
le3 = sprintf('derivada segunda');
legend(le1,le2,le3)
hold off

%[dx, h]=aprox_dx_2PP(f, x0, exp_min, exp_max);

[dx, h]=aprox_dx_3PC(f, x0, exp_min, exp_max)

df(x0) % valor real o analitico
Error=abs((df(x0) - dx));

expo=[exp_min:exp_max];
h = 10.^expo;
figure(2)
%semilogy(h,Error,'b-*')
loglog(h,Error,'b-*')
xlabel('h')
ylabel('Error')
title('Grafica del Error en funcion de "h"')
grid on
grid minor
%hold on

% Comprobacion cota de error teorico
hh=0.1;
fx0 = f(x0)
fx1 = f(x0+hh);
fx2 = f(x0-hh);
%dfa = (fx1-fx0)/hh;
dfa_c = (fx1 - fx2)./(2*hh); % valor aproximado
df(x0) % valor real o analitico
acotar=max(abs(ddf(x0)),abs(ddf(x0+hh)));
%Error_teorico = ((hh)/2)*acotar
Error_teorico_c = ((hh)^2/6)*acotar
Error_h=abs((df(x0) - dfa_c))

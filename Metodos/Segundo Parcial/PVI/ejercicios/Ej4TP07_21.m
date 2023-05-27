# Calculo Octave solucion ODE
#Ej4TP7
clear all
clc; clf
inter = [0,1];
h = 0.1;
L = (inter(2)-inter(1))/h;
t = linspace(inter(1),inter(2),L+1)';

# Caso I
f = @(t,y) t*exp(3*t) - 2*y;
y0 = 0; # valor inicial

# Caso II
%f =@(t,y) -2*y;
%y0 = 3;

# Caso III
%f =@(t,y) -cos(2*pi*t.^2)-t*y;
%y0 = 2;
%dfy = @(t) -t;

# Exacta
fex=@(t) (t.*exp(3*t))./5 - (exp(3*t))./25 + (exp(-2*t))./25;
fex = fex(t);

%fex = @(t) 3*exp(-2*t);
%fex = fex(t);

figure(1)
# ploteamos la exacta
plot(t,fex,'k-d')
grid on
grid minor
hold on

%========================================================
dfy = @(t) -2;
[tcn, wcn] = Crank_Nicholson_Newton(f,dfy,0,1,0,L,100,0.00001);
[tea, wea] = euler_atras_nw(f, dfy, 0, 1, 0, L, 100, 0.00001);
[tE,wE] = euler(f,inter,y0,L);
%========================================================
plot(tcn,wcn,'m-o')
plot(tea,wea,'g-*')
plot(tE,wE,'b-*')

title('PVI - Metodo de Crank-Nicholson con Newton-Eulercon Newton y Euler')
xlabel('Tiempo [s]')
ylabel('Solucion PVI')
legend('fex','CN-NR','Euler-Atras','Euler')
hold off

% calculamos el error absoluto Exacta - CN y el relativo

ErrorCN = abs(fex - wcn);
ErrorCN_rel = abs(fex - wcn)./abs(fex);

ErrorEA = abs(fex - wea);
ErrorEA_rel = abs(fex - wea)./abs(fex);

ErrorE = abs(fex - wE);
ErrorE_rel = abs(fex - wE)./abs(fex);


figure(2)
semilogy(tcn,ErrorCN,'b-*')
hold on
semilogy(tea,ErrorEA,'r-*')
semilogy(tE,ErrorE,'c-*')

semilogy(tcn,ErrorCN_rel,'k-o')
semilogy(tea,ErrorEA_rel,'m-d')
semilogy(tE,ErrorE_rel,'c-d')
title('PVI - Error')
xlabel('Tiempo [s]')
ylabel('Error Global')
legend('ErrorCN','ErrorEA','ErrorE','ErrorCN-Rel','ErrorEA-Rel','ErrorE-Rel')
grid on
grid minor


# Aproximacion por minimos cuadrados.
# Ej01MC
clear all
clf
clc
%x = [1858 1877 1900 1920 1940 1960 1981 2008]';
%y = [137960 165466 213550 251258 450756 505066 751734 807200]'
 x = [1 2 3 4 5 6 7 8 9 10]'
 y = [1.3 3.5 4.2 5.0 7.0 8.8 10.1 12.5 13.0 15.6]'

figure(1)
plot(x,y,'r*');
xlabel ('X')
ylabel('Y')

format long
%y15 = interp1(x,y,3.5)

v=1:1:10;
%v=1858:1:2008;
%y2 = interp1(x,y, v);
%figure(2)
%plot(x,y,'r*', v, y2,'b')
%xlabel ('X')
%ylabel('Y')
%grid on

%[P, L] = Lagrange(x,y);
%[P, c, N] = PolIntNewton(x, y);
%p35 = polyval(P,3.5)

###############################
p = polyfit(x,y,length(x)-1);
y3 = polyval(p,v);

%y35 = polyval(p,3.5)

figure(3)
%plot(x,y,'r*', v, y2,'b', v, y3, 'm')
plot(x,y,'r*',  v, y3, 'm')
grid on
xlabel ('X')
ylabel('Y')

# Errores

Ea1 = abs(y15 - p35)
Ea2 = abs(y35 - p35)
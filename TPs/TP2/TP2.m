# INCISO A:
disp('INCISO A:');
E = @(t) ((t+1/3).^3+1/3).*e.^(-t);
# E(t) = 1.5 => E(t) - 1.5 = 0:
Ea = @(t) ((t+1/3).^3+1/3).*e.^(-t) - 1.5;
dE = @(t) (e.^(-t).*(3.*(t+1/3).^2-(t+1/3).^3-1/3));

# grafico E(t) y su primera derivada junto a y = 0
figure(1);
t = linspace(0,10,100);
plot(t, E(t), '-m');
hold on;
plot(t, Ea(t), '-y');
plot(t, dE(t), '-b');
y = @(t) t.*0;
grid on;
grid minor;
plot(t,y(t),'-k');

# para determinar p0 uso aproximaciones de las raíces
# que, tras ver en la gráfica, se acercan a 2 y a 4.
p0 = 2;
tol = 10^-6;
maxit = 50;
[pA, r_hA, itA, tA] = newtonRaphson(Ea, dE, p0, maxit, tol);
disp('El instante de tiempo (1) en el que la energía del dispositivo es igual a 1.5 es:');
pA
disp('El número de iteraciones realizadas para determinarlo:');
itA

p0 = 4;
disp('');
[pA, r_hA, itA, tA] = newtonRaphson(Ea, dE, p0, maxit, tol);
disp('El instante de tiempo (2) en el que la energía del dispositivo es igual a 1.5 es:');
pA
disp('El número de iteraciones realizadas para determinarlo:');
itA

# INCISO B:
disp('');
disp('INCISO B:');
d2E = @(t) e.^(-t).*((t+1/3).^3-6.*(t+1/3).^2+6.*(t+1/3)+1/3);

# grafico E(t), su primera y segunda derivada junto a y = 0.
figure(2);
t = linspace(0,10,100);
plot(t, E(t), '-m');
hold on;
plot(t, dE(t), '-b');
plot(t, d2E(t), '-g');
y = @(t) t.*0;
grid on;
grid minor;
plot(t,y(t),'-k');

# tras observer la gráfica, aproximo:
p0=3;
[pB, r_hB, itB, tB] = newtonRaphson(dE, d2E, p0, maxit, tol);
disp('El tiempo en el que se da la máxima energía es:');
pB
disp('El número de iteraciones realizadas para determinarlo:');
itB
disp('La máxima energía es:');
maxE=E(pB)


# INCISO C:
disp('');
disp('INCISO C:');
d3E = @(t) e.^(-t).*(6-1/3-18.*(t+1/3)+9.*(t+1/3).^2-(t+1/3).^3);

# grafico E(t), su primera, segunda y tercera derivada junto a y = 0.
figure(3);
t = linspace(0,10,100);
plot(t, E(t), '-m');
hold on;
plot(t, dE(t), '-b');
plot(t, d2E(t), '-g');
plot(t, d3E(t), '-r');
y = @(t) t.*0;
grid on;
grid minor;
plot(t,y(t),'-k');

# tras observer la gráfica, aproximo:
p0=1;
disp('El instante de tiempo donde se da la máxima tasa de crecimiento instantánea es:');
[pC, r_hC, itC, tC] = newtonRaphson(d2E, d3E, p0, maxit, tol);
pC
disp('El número de iteraciones realizadas para determinarlo:');
itC

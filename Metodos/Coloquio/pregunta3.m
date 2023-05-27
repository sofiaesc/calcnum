clear; clc;
format long;

# Similar al ejercicio 6 de la GTP 8;

#Datos
a = 0;
b = 2;
A = 0.01;
C = 0.217;
rho = 2.7;

K = 0.57;
u0 = 6;
H = 15;
ue = 4;

#Ecuacion diferencial
# -0.57u'' + (0.1x^3 + 2.5)u = 2x(2-x)

#Reordenando
# u'' = (1/0.57)(0.1x^3 + 2.5)u - (2/0.57)x(2-x)

#Condiciones de contorno
# u(0) = 6
# 0.57u'(2) + 15u(2) = 4

#Coeficiente de reaccion
cr = @(x) 0.1.*x.^3 + 2.5; 

p = @(x) 0*x;                 % Término con u'
q = @(x) (cr(x))./(K);        % Término con u
r = @(x) (2.*x.*(2-x))./(-K); % Fuente de calor

f = @(x) [p(x) q(x) r(x)];

# -K*duL = H*uL-H*ue) -> K*duL + H*uL +  = H*ue

rob = [K H H*ue];

h = 0.1;
h = h/2; % h = 0.05
h = h/2; % h = 0.025
h = h/2; % h = 0.0125
h = h/2; % h = 0.00625     % 4.45991801005721
%h = h/2; % h = 0.003125    % 4.45990962426665

# por lo menos h = 0.00625 para 4 digitos decimales exactos


L = (b-a)/h;

[x y] = dif_fin_rob(f,a,b,u0,rob,L);

# Temperatura en el extremo derecho de la barra
y_der = y(end);

# (b)

flujo_b = H*(y(end) - ue);

%[c1 c2 c3 c4] = cubic_spline_natural(x',y');
%M = [c4' c3' c2' c1'];
%S = crear_spline(M,x);

figure(1)
hold on;
grid on;
plot(x,y,'r-');
%plot(x,S(x));

%dy_a = aprox_dx_2PP(S,a,-4,-4);
%flujo = dy_a*(-K);


# (c)
I_trap = trapcomp(x,y);
I = simpsoncomp(x,y);

E = A*C*I*rho;












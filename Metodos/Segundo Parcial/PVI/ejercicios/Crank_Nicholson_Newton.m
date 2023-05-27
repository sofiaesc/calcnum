function [t, w]=Crank_Nicholson_Newton(f, dfy, t0, tn, alpha, N, maxit, tol)
h = (tn-t0)/N; % paso de tiempo o de la variable independiente
t = [t0:h:tn]';
w = zeros(N+1,1);
w(1) = alpha; % Valor inicial del calculo
for i=1:N
w0 = w(i);
fi = f(t(i),w(i));
for it=1:maxit
fim1 = f(t(i+1),w0);
dfim1 = dfy(t(i+1),w0);
% Funcion recursiva en forma implicita.
g = w0 - w(i) - h*0.5*(fi + fim1); % Representa la función implicita
dg = 1 - h*0.5*dfim1; % derivada de la función implicita
% Ecuacion recursiva de Newton (sistema no lineal)
w(i+1) = w0 - g/dg; % calculamos los ceros de la funcion implicita con Newton
if (abs(w(i+1)-w0) < tol)
break;
end %if
w0 = w(i+1);
end %for

% Solución del PVI por C-N con iteraciones de Newton
w(i+1) = w(i) +(h/2)*( fi + f(t(i+1),w(i+1)));
end %for

end %function
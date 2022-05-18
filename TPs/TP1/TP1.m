N = 100;
[A,b,x0] = CrearSistema (N);
maxit = 20000;
tol = 1e-6;

[L D U]=DescomponerMatriz(A);

disp("JACOBI:")
#[xJ, r_hJ, itJ, tJ]=Jacobi(A, b, x0, maxit, tol);
#r_eJ = max(abs(eig(-inv(D)*(L+U)))) # radio espectral
#itJ # cantidad de iteraciones
#tJ # tiempo de ejecución

disp("")
disp("GAUSS-SEIDEL:")
#[xGS,r_hGS,itGS,tGS] = GaussSeidel(A,b,x0,maxit,tol);
#r_eGS = max(abs(eig(-inv(D+L)*U))) # radio espectral
#itGS # cantidad de iteraciones
#tGS # tiempo de ejecución

disp("")
disp("SOR:")

# verificando s.d.p.
tf = issymmetric(A);
d = eig(A);
isposdef = all(d > 0); # resulta en 1, luego es verdadero y todos los eig > 0.
w = 2/(1+sqrt(1-r_eJ^2));

[w2] = optimoSor(A,b,x0,tol,maxit)

[xSOR,r_hSOR,itSOR,tSOR] = SOR(A,b,x0,maxit,tol,w);
r_eSOR = max(abs(eig(inv(D+w*L)*((1-w)*D-w*U)))) # radio espectral
itSOR # cantidad de iteraciones
tSOR # tiempo de ejecución

disp("")
disp("GRADIENTE CONJUGADO:")
[xGC, r_hGC, itGC, tGC] = GradienteConjugado(A, b, x0, tol);
itGC # cantidad de iteraciones
tGC # tiempo de ejecución

disp("")
disp("ELIMINACIÓN DE GAUSS:")
[xG,tG] = Gauss(A,b); 
tG # tiempo de ejecución

#GRÁFICA DE CONVERGENCIA DE CADA MÉTODO:
figure(1)
semilogy(r_hJ,'-b')
grid on
grid minor
hold on
semilogy(r_hGS,'-r')
semilogy(r_hSOR,'-g')
semilogy(r_hGC,'-m')
title('Convergencia de cada método')
hold off

#GRÁFICA DE LA SOLUCIÓN DEL SISTEMA
z = linspace(0,1,N);
figure(2)
plot(z,xJ,'-b',z,xGS,'-r',z,xSOR,'-g',z,xGC,'-m',z,xG,'-y')
grid on
grid minor
title('Soluciones del sistema')
hold off
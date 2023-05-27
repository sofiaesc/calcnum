
# FUNCIONES QUE SIRVEN:
n�mero de condici�n: cond(A)
norma de la matriz: norm(A)

# M�TODOS DIRECTOS:
Gradiente Conjugado:
Si la matriz A tiene rango r, converge a lo sumo en r iteraciones.
Es eficiente si el n�mero de condici�n es bajo (~1). Sino converge lento.

# M�TODOS ITERATIVOS:
Un MI converge si ||T|| < 1 (norma de la matriz de iteraci�n).
Un MI converge si p(T) < 1 (radio espectral de la matriz de iteraci�n).
Converge m�s lento a medida que tiende a 1. Si tiende a 0, converge r�pido.

Jacobi: 
- Si la matriz es diagonalmente dominante, Jacobi converge para cualquier x0.

Gauss-Seidel:
- Si la matriz es diagonalmente dominante, G-S converge.
- Si la matriz es sim�trica definida positiva, G-S converge.

SOR:
Si w = 1, SOR -> Gauss-Seidel

#M�TODOS DE NO LINEALES:
Bisecci�n: 
Siempre converge globalmente pero lineal (lento).

Punto fijo: 
Si g es continua en [a,b] y existe g'(x) en (a,b) con |g'(x)| <= k < 1 y p0 en [a,b], converge al PF.
Mientras menor sea k, m�s r�pido converge. Si k~1, converge lento.
Si |g'(p)| != 0, converge lineal.
Si |g'(p)| = 0, podr�a converger cuadr�tico.

Newton-Raphson:
Si p es ra�z simple, converge cuadr�tico. Si es raiz m�ltiple, converge lineal.
(raiz simple: f(p) = 0, f'(p) != 0 para f cont. deriv. en [a,b])
p0 tiene que estar cerca de p para converger (local), y regularidad en la derivada.
Dado un [a,b] tiene que darse f(a)*f(b)<0.

Secante: 
No converge siempre. 

Regula Falsi:
Converge globalmente (siempre).
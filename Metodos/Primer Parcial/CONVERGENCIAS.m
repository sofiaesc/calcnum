
# FUNCIONES QUE SIRVEN:
número de condición: cond(A)
norma de la matriz: norm(A)

# MÉTODOS DIRECTOS:
Gradiente Conjugado:
Si la matriz A tiene rango r, converge a lo sumo en r iteraciones.
Es eficiente si el número de condición es bajo (~1). Sino converge lento.

# MÉTODOS ITERATIVOS:
Un MI converge si ||T|| < 1 (norma de la matriz de iteración).
Un MI converge si p(T) < 1 (radio espectral de la matriz de iteración).
Converge más lento a medida que tiende a 1. Si tiende a 0, converge rápido.

Jacobi: 
- Si la matriz es diagonalmente dominante, Jacobi converge para cualquier x0.

Gauss-Seidel:
- Si la matriz es diagonalmente dominante, G-S converge.
- Si la matriz es simétrica definida positiva, G-S converge.

SOR:
Si w = 1, SOR -> Gauss-Seidel

#MÉTODOS DE NO LINEALES:
Bisección: 
Siempre converge globalmente pero lineal (lento).

Punto fijo: 
Si g es continua en [a,b] y existe g'(x) en (a,b) con |g'(x)| <= k < 1 y p0 en [a,b], converge al PF.
Mientras menor sea k, más rápido converge. Si k~1, converge lento.
Si |g'(p)| != 0, converge lineal.
Si |g'(p)| = 0, podría converger cuadrático.

Newton-Raphson:
Si p es raíz simple, converge cuadrático. Si es raiz múltiple, converge lineal.
(raiz simple: f(p) = 0, f'(p) != 0 para f cont. deriv. en [a,b])
p0 tiene que estar cerca de p para converger (local), y regularidad en la derivada.
Dado un [a,b] tiene que darse f(a)*f(b)<0.

Secante: 
No converge siempre. 

Regula Falsi:
Converge globalmente (siempre).
% DOS PROBLEMAS EN APROXIMACIÓN Y AJUSTE DE CURVAS:
% 1. pares de valores (xi,yi). Error real: ei = yi - P(xi)
% 2. función f(x) en un [a,b]. Error real: e(x) = f(x) - P(x).

% MINIMIZAR EL ERROR:
% min(E = máx(|yi - P(xi)|)) ---> da mucho peso a un único punto alejado.
% min(E = Suma(|yi - P(xi)|)) ---> da poco peso a valores extremos.
% min(E = Suma(|yi - P(xi)|^2)) ---> más conveniente de los tres.

% Newton-Cotes cerradas:
% n=1: Regla del Trapecio --> Integra exactamente polinomio de grado 1.
% n=2: Regla de Simpson --> Integra exactamente polinomio de grado 3.
% n=3: Regla de Simpson 3/8 --> Integra exactamente polinomio de grado 3.
% n=4 --> Integra exactamente polinomio de grado 5.

% Newton-Cotes (n+1) puntos es exacta para funciones que sean polinomios
% de grado menor o igual que n.

% EXISTENCIA Y UNICIDAD PVI:
% Si f satisface una condición de Lipschitz en D para la variable.
% Constante de Lipschitz L: valor abs. de la derivada parcial de f(x,y) en y <= L, L > 0.

% PVI BIEN PLANTEADO:
% f es continua y satisface una condición de Lipschitz en D.

% ERRORES EN PVI:
% Errores de truncamiento local (ETL): Truncado de Taylor.
% Errores de redondeo local (ERL): Aritmética finita.
% Errores de truncamiento global (ETG): Suma de ETL.
% Errores de redondeo global (ERG): Suma de ERL.
% Error total: Suma de ETG y ERG.

% yn+1 = suma(aj yn-j) + h * suma(bj f(tn-j, yn-j))
% CONSISTENCIA DE UN MULTIPASO:
% suma de los aj = 1, y - suma(j*aj) + suma(bj) = 1.
% CONDICIÓN DE LA RAIZ:
% p(r) = r^(p+1) - suma(aj * r^(p-j)).
% ESTABILIDAD DE UN MULTIPASO: Cumple con condición de la raiz.

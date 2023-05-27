% TestEj08.m
% Mezcla de gases no reactivos
% Sistema S p = h
% hi: altura del pico de la i-esima mezcla con sus preaiones parciales pj
% S: matriz de coeficientes de sensibilidad
% que satisface un conjunto de n ecuaciones  que son una combinacion lineal
% de las presiones parciales
clear all; clc

S = [16.87 0.1650 0.2019 0.3170 0.2340 0.1820 0.11;
      0 27.70 0.8620 0.0620 0.0730 0.1310 0.12;
       0 0 22.35 13.05 4.42 6.001 3.043;
       0 0 0 11.28 0 1.11 0.3710;
       0 0 0 0 9.85 1.1684 2.108;
       0 0 0 0 0.2990 15.98 2.107;
       0 0 0 0 0 0 4.67 ]


h = [17.1 65.1 186 82.7 84.2 63.7 119.7]'


n = length(S(:,1))

[p,Indice] = elim_gaussIndice(S,h)

Sumh = 0;

for i=1:n
  Sumh = Sumh + p(i);
endfor

disp('La solucion del sistema es:')
p
disp('la presion de la mezcla es:')
Sumh

disp('La diferencia con la medida es:')
Med=38.78

ErrorAbsoluto = abs(Med - Sumh)
ErrorRelativo = (ErrorAbsoluto/Med)*100

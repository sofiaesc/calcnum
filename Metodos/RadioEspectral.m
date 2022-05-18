function [rhoA] = RadioEspectral(A,metodo,w)
% descomponemos la matriz A para calcular la matriz de iteracion
[L D U]=DescomponerMatriz(A); 

% elegimos el método
% Jacobi

if(metodo=='ja')
[rhoA pos]=max(abs(eig(-inv(D)*(L+U))));

% Gauss-Seidel
else 
if(metodo=='gs')
[rhoA pos]=max(abs(eig(-inv(D+L)*(U))));

else (metodo =='sor')
[rhoA pos]=max(abs(eig(-inv(D+w*L)*((w-1)*D+w*U))));

endif
endif

endfunction
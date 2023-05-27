function [T, c, t]=Tc_Jacobi(A, b)
 tic();
 U = - triu(A,1);
 Dinv = inv( diag( diag(A) ) );
 L = -tril(A,-1);
 T = Dinv * (U+L);
 c = Dinv * b;
 t = toc();
endfunction
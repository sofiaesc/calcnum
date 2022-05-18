function  [w] = optimoSor(A,b,x0,tol,itMax)
   itAux = 100;
   w=0.01;
   for i=0.01:.01:1.99
    
       [x nit r_h] = SOR(A, b, x0, itMax, tol, i);
       if(nit<itAux)
        w=i;
        itAux = nit;
        endif
   endfor

 endfunction
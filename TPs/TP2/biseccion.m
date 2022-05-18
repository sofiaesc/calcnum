## Copyright (C) 2022 sofia
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} biseccion (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sofia <sofia@DESKTOP-T0NT4RT>
## Created: 2022-05-02

function [p, it] = biseccion(f, a, b, maxit, tol)
 %[p, rh, it, tiempo,nitmin] = biseccion(f, a, b, maxit, tol)
  tic()
 % nitmin = log((b-a)/tol)/log(2)
  fa = f(a);
  fb = f(b);
  if sign(fa)*sign(fb) > 0
    error('No se cumple la regla de los signos y el TVN');
  endif
   it = 0;
   while (it < maxit)
    it++;
    p = a + (b-a)/2;
    fp = f(p);
    rh(it) = abs(fp);
    if (rh(it) < tol)
      break;
    endif
    if (sign(fp)*sign(fb) < 0)
      fa = fp;
      a = p;
     else
      fb = fp;
      b = p;
    endif 
   endwhile
  t = toc();
       
endfunction

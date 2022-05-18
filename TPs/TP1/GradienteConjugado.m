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
## @deftypefn {} {@var{retval} =} GradienteConjugado (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sofia <sofia@DESKTOP-T0NT4RT>
## Created: 2022-04-23

function [x, r_h, it, t] = GradienteConjugado(A, b, x0, tol)
 tic();
 x=x0;
 n = length(b);
 r = b - A*x;
 p = r;
 rho = r'*r;
 rho0 = r;
 it = 1;
 
 while(it <= n)
 if norm( p ) < tol
 break;
 endif
 a = A * p;
 m = p' * a;
 alfa = rho/m;
 x = x + alfa * p;
 r = r - alfa * a;
 rho0 = rho;
 rho = r'*r;
 r_h(it) = norm(r,2);
 if r_h(it) < tol
 break;
endif
 gamma = rho/rho0;
 p = r + gamma*p;
 it = it + 1;
 endwhile
 t = toc();
endfunction

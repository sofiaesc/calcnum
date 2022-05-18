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
## @deftypefn {} {@var{retval} =} GaussSeidel (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sofia <sofia@DESKTOP-T0NT4RT>
## Created: 2022-04-23

function [x,r_h,it,t] = GaussSeidel(A,b,x0,maxit,tol)
  tic();
  n = length(b);
  x = x0;
  it = 1;
  while ( it <= maxit )
    for i = 1:n
      x(i) = (b(i) - A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * x0(i+1:n) ) /A(i,i);
    endfor
     r_h(it+1) = norm(A*x - b);
    if r_h(it+1) < tol
    break;
     endif
    x0 = x;
    it = it +1;
  endwhile
  t = toc();
 endfunction

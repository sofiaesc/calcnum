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
## @deftypefn {} {@var{retval} =} secante (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sofia <sofia@DESKTOP-T0NT4RT>
## Created: 2022-05-02

function [p, r_h, it, t] = secante(f, p0, p1, maxit, tol)
  it = 2;
  q0 = f(p0);
  q1 = f(p1);
  while it < maxit
    p = p1 - ((q1*(p1-p0))/(q1-q0));
    r_h[it] = |p - p1|;
    if r_h[it] < Tol
      break;
    endif  
    it = it + 1;
    p0 = p1;
    q0 = q1;
    p1 = p;
    q1 = f(p);
  endwhile
endfunction

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
## @deftypefn {} {@var{retval} =} newton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sofia <sofia@DESKTOP-T0NT4RT>
## Created: 2022-05-02

function [p, r_h, it, t] = newtonRaphson(f, df, p0, maxit, tol)
  tic();
  it = 1;
  fp=f(p0);
  while it < maxit
    p = p0 - (fp/df(p0));
    fp = f(p);
    r_h(it)=norm(((p-p0)),inf);
    if r_h(it) < (tol*abs(p))
      break;
    endif
    it = it + 1;
    p0 = p;
  endwhile
  
  t = toc();
endfunction

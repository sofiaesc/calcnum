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
## @deftypefn {} {@var{retval} =} CrearSistema (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sofia <sofia@DESKTOP-T0NT4RT>
## Created: 2022-04-23

function [A,b,x0] = CrearSistema (N)

A = (2*diag(ones(1,N),0)-1*diag(ones(1,N-1),1)-1*diag(ones(1,N-1),-1));
A(1,[1:2])=[1 0];
A(N,[N-1:N])=[0 1];

b = ones(N,1);
b(1) = 0;
b(N) = 0;
b = [b(1) ; (1/N^2).*ones(N-2,1); b(N)];
x0 = zeros(N,1);

endfunction

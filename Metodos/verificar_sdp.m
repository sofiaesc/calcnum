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
## @deftypefn {} {@var{retval} =} verificar_sdp (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sofia <sofia@DESKTOP-T0NT4RT>
## Created: 2022-05-08

function isposdef = verificar_sdp (A)
tf = issymmetric(A);
d = eig(A);
isposdef = all(d > 0);
endfunction

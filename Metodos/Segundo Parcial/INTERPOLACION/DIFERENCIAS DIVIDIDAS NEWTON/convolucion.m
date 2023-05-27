clear all; clc
t = 0:.01:5;
x = ones(size(t));
h1 = cos(pi*t);
h2 = 2*exp(2*t);
z1 = conv(h1,x)*0.01;
z2 = conv(h2,x)*0.01;
z = z1+z2;
plot(0:0.01:10,z);
title('h_1(t)*x(t)+h_2(t)*x(t)')
grid on; grid minor;
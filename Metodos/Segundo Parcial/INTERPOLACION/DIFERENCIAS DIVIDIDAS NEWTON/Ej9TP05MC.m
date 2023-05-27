# Aproximacion por minimos cuadrados.
# Ej9TP05MC
clear all
clf
clc

 x = [0 1 2 3 4 5 6]
 y = [432 599 1012 1909 2977 4190 5961]

format long
figure(1)
plot(x,y,'r*');
xlabel ('X')
ylabel('Y')
grid on
hold on
%%%%%%%%%%%%%%%%%%%%%
v=0:1:6
###############################
n = length(x)-1
p = polyfit(x,y,n)
z = polyval(p,v);

%figure(2)
plot(v, z, 'm')



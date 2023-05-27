#GRAFICA graficaEj10
x = linspace(0,2,20);
phi = linspace(0,2*pi,30);
[x,phi]=meshgrid(x,phi);
y = cos(phi).*f(x);
z = sin(phi).*f(x);
surf(x,y,z);
xlabel("X");
ylabel("Y");
zlabel("Z");
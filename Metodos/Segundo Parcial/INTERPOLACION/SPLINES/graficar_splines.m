function graficar_splines(t,x,y,a1,b1,c1,d1,a2,b2,c2,d2)
for i=1:4
tt = [t(i):1/100:t(i+1)]; #divido el subintervalo i
xx = a1(i) + b1(i)*(tt-t(i)) + c1(i)*(tt-t(i)).^2 + d1(i)*(tt-t(i)).^3;
yy = a2(i) + b2(i)*(tt-t(i)) + c2(i)*(tt-t(i)).^2 + d2(i)*(tt-t(i)).^3;
figure(1) #activo ventana 1
hold on
plot(tt,xx,'r') #grafico en ventana 1: x vs t en subintervalo i
hold on
plot(t(i),x(i),'*r') #grafico asterisco en punto [t_i,x_i]
figure(2) #activo ventana 2
hold on
plot(tt,yy) #grafico en ventana 2: y vs t en subintervalo i
hold on
plot(t(i),y(i),'*') #grafico asterisco en punto [t_i,x_i]
figure(3) #activo ventana 3
hold on
plot(xx,yy,'g') #grafico en ventana 3: x vs y en subintervalo i
endfor
figure(1) #activo ventana 1
hold on
plot(t(5),x(5),'*r') #grafico asterisco en punto [t_i,x_i]
figure(2) #activo ventana 2
hold on
plot(t(5),y(5),'*') #grafico asterisco en punto [t_i,x_i]
endfunction
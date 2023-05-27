clear all;
clc; clf;
%graficaFunction.m
%f = @(t,y) y-(t^2)+1;
T=5;
f = @(t,y) -y + sin(t) + cos(t);
y0 = 0; % Condicion Inicial
xint=0:0.2:5;
yint=-2.5:0.25:4;

figure(1)
plot(0,sin(0),'bo'); hold on
title(sprintf('f=-y+sint(t)+cos(t)'))
axis([0 5 -2.5 4]);
grid on; grid minor;
%waitforbuttonpress
plot(xint'*ones(size(yint)),ones(size(xint'))*yint,'r.');
dirfield(f,xint,yint); 
%hold on
%waitforbuttonpress
tv= linspace(0,T,50);
for i=1:length(tv)
plot(tv(1:i),sin(tv(1:i)),'k');
pause(0.1)
end

% calculamos por Euler
[t,y1] = euler(f,[0 5],0,50);
[t,y2] = euler(f,[0 5],2,50);
f1 = @(t,y) y - sin(t) + cos(t);
[t,y3] = euler(f1,[0 5],0.1,50);

pause()
plot(0,2,'ko');
plot(t,y2,'-k','linewidth', 2)
pause()
plot(0,0.1,'go');
plot(t,y3,'m-','linewidth', 2)

hold off